
# HealthIndicatorDetailDto


## Properties

Name | Type
------------ | -------------
`status` | string
`message` | string
`mode` | string
`redisRequired` | boolean

## Example

```typescript
import type { HealthIndicatorDetailDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "status": null,
  "message": null,
  "mode": null,
  "redisRequired": null,
} satisfies HealthIndicatorDetailDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as HealthIndicatorDetailDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


