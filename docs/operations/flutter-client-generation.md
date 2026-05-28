# Flutter Client Generation

## Contract Source

- The backend contract lives at `packages/contracts/openapi/openapi.json`.
- Flutter client generation uses the official OpenAPI Generator `dart-dio` target with config from `packages/contracts/openapi/dart-dio-config.yaml`.

## Local Commands

```bash
pnpm.cmd openapi:generate
pnpm.cmd openapi:verify
pnpm.cmd flutter:client:verify
pnpm.cmd flutter:client:generate
```

## Expected Behavior

- `openapi:verify` regenerates the OpenAPI file and fails if the checked-in artifact is not stable.
- `flutter:client:verify` generates the Dart/Dio client into a temporary directory through the OpenAPI CLI and fails if generation breaks.
- `flutter:client:generate` writes a local client artifact to `packages/contracts/generated/flutter`.

## Tooling Requirements

- Local Flutter client generation requires Java to be installed, because the repository standardizes on the official `@openapitools/openapi-generator-cli` NPM package which relies on Java internally.
- CI uses the same CLI generator path, so local and CI generation stay aligned.

## Downstream Versioning Guidance

- Treat each backend release as a matching client-contract release.
- Publish the generated client from a downstream Flutter repo or package pipeline rather than committing generated Dart code back into this backend repository by default.
- If a breaking backend contract change is intentional, bump the downstream client version in lockstep with the API release notes.
