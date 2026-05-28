# Error Codes

## Phase 00 Baseline

- `BAD_REQUEST`: validation or malformed request payload failure
- `UNAUTHORIZED`: missing or invalid authentication
- `FORBIDDEN`: authenticated caller lacks required access
- `NOT_FOUND`: requested resource does not exist or is not visible
- `RATE_LIMIT_EXCEEDED`: throttling guard blocked the request
- `HTTP_EXCEPTION`: fallback code for framework-level HTTP exceptions not yet specialized
- `INTERNAL_SERVER_ERROR`: unexpected unhandled application failure

## Response Shape

```json
{
  "error": "Human-readable summary",
  "code": "MACHINE_READABLE_CODE",
  "details": [],
  "requestId": "uuid",
  "path": "/api/v1/...",
  "timestamp": "2026-05-25T00:00:00.000Z"
}
```
