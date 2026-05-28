# Contracts

Generated and committed API artifacts live here.

## OpenAPI

- Source contract: `packages/contracts/openapi/openapi.json`
- Generator config for Flutter: `packages/contracts/openapi/dart-dio-config.yaml`

## Verification

- `pnpm.cmd openapi:generate` regenerates the OpenAPI artifact.
- `pnpm.cmd openapi:verify` checks that regenerating OpenAPI does not change the checked-in artifact.
- `pnpm.cmd flutter:client:verify` uses the official OpenAPI Generator Docker image to prove the `dart-dio` client can still be generated.

## Generated Flutter Client

- Local output path for explicit generation: `packages/contracts/generated/flutter`
- The generated client is treated as a build artifact and is not committed from this repository by default.
