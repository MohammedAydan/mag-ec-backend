import { DocumentBuilder, type SwaggerDocumentOptions } from '@nestjs/swagger';

export const API_PREFIX = '/api/v1';

export function buildOpenApiConfig() {
  return new DocumentBuilder()
    .setTitle('Universal E-Commerce API')
    .setDescription('Typed public and administrative contract for the headless commerce backend.')
    .setVersion('1.0.0')
    .addBearerAuth(
      {
        type: 'http',
        scheme: 'bearer',
        bearerFormat: 'JWT',
        description: 'JWT access token returned by the authentication endpoints.',
      },
      'bearer',
    )
    .build();
}

export function buildOpenApiDocumentOptions(): SwaggerDocumentOptions {
  return {
    ignoreGlobalPrefix: false,
    deepScanRoutes: true,
    operationIdFactory: (controllerKey: string, methodKey: string) =>
      `${stripControllerSuffix(controllerKey)}_${methodKey}`,
  };
}

function stripControllerSuffix(controllerKey: string): string {
  return controllerKey.replace(/Controller$/, '');
}
