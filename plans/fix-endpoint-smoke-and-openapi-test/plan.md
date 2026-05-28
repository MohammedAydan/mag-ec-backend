# Goal

Stabilize API endpoint responses in local non-Docker mode and run repeated full endpoint verification from OpenAPI.

# Acceptance Criteria

- Public endpoint `GET /api/v1/catalog/products` no longer returns 500.
- A script can probe all OpenAPI endpoints for 3 rounds.
- Report includes all 5xx failures with request details.

# Approach

1. Fix immediate runtime issue in catalog public controller causing undefined service access.
2. Add an OpenAPI-driven endpoint probe script to call all documented paths and methods.
3. Execute probe script multiple rounds and inspect server logs for remaining 5xx.
4. Apply targeted fixes for any discovered deterministic 5xx.

# Scope

In:

- Controller/runtime fixes for observed 5xx.
- Endpoint probing scripts and results.
  Out:
- Full feature development unrelated to endpoint stability.

# Dependencies

- Local running API process.
- Generated `packages/contracts/openapi/openapi.json`.

# Complexity

M
