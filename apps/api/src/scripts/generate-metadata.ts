import fs from 'node:fs/promises';
import path from 'node:path';

import { PluginMetadataGenerator } from '@nestjs/cli/lib/compiler/plugins/plugin-metadata-generator';
import { ReadonlyVisitor } from '@nestjs/swagger/plugin';

async function run(): Promise<void> {
  const generator = new PluginMetadataGenerator();
  const currentDir = __dirname;
  const srcDir = path.resolve(currentDir, '..');
  const tsconfigPath = path.resolve(currentDir, '../../tsconfig.json');

  console.log(`Generating Swagger metadata...`);
  console.log(`Source directory: ${srcDir}`);
  console.log(`tsconfig path: ${tsconfigPath}`);

  const metadataFilePath = path.join(srcDir, 'metadata.js');
  const oldMetadataTsFilePath = path.join(srcDir, 'metadata.ts');

  await Promise.all([
    fs.rm(metadataFilePath, { force: true }),
    fs.rm(oldMetadataTsFilePath, { force: true }),
  ]);
  console.log(`Cleaned old metadata files.`);

  generator.generate({
    visitors: [
      new ReadonlyVisitor({
        introspectComments: true,
        pathToSource: srcDir,
      }),
    ],
    outputDir: srcDir,
    watch: false,
    tsconfigPath: path.relative(process.cwd(), tsconfigPath),
    filename: 'metadata.js',
  });

  await postProcessMetadata(metadataFilePath, srcDir);
}

async function postProcessMetadata(metadataFilePath: string, srcDir: string): Promise<void> {
  console.log(`Post-processing ${metadataFilePath} to fix NodeNext module resolution...`);
  const content = await fs.readFile(metadataFilePath, 'utf8');

  // Replace relative imports/keys like "./modules/..." with "./modules/....js"
  const fixedContent = content.replace(
    /(['"])(\.\.?\/[^\n'"]+?)\1/g,
    (match: string, quote: string, importPath: string) => {
      if (
        importPath.endsWith('.js') ||
        importPath.endsWith('.ts') ||
        importPath.endsWith('.json')
      ) {
        return match;
      }
      return `${quote}${importPath}.js${quote}`;
    },
  );

  // Write to src/metadata.js
  await fs.writeFile(metadataFilePath, fixedContent, 'utf8');

  // Also write to dist/apps/api/src/metadata.js if the dist directory exists
  const distMetadataDir = path.resolve(srcDir, '../../../dist/apps/api/src');
  try {
    await fs.mkdir(distMetadataDir, { recursive: true });
    await fs.writeFile(path.join(distMetadataDir, 'metadata.js'), fixedContent, 'utf8');
    console.log(
      `Swagger metadata copied to compiled dist directory at ${path.join(
        distMetadataDir,
        'metadata.js',
      )}`,
    );
  } catch (err) {
    console.warn(`Could not write metadata.js to dist directory:`, err);
  }

  console.log(`Swagger metadata generated and post-processed successfully.`);
}

run().catch((err: unknown) => {
  console.error('Failed to generate Swagger metadata:', err);
  process.exit(1);
});
