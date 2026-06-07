
# HealthReadinessResponseDto


## Properties

Name | Type
------------ | -------------
`status` | string
`details` | [{ [key: string]: HealthIndicatorDetailDto; }](HealthIndicatorDetailDto.md)
`info` | [{ [key: string]: HealthIndicatorDetailDto; }](HealthIndicatorDetailDto.md)
`error` | [{ [key: string]: HealthIndicatorDetailDto; }](HealthIndicatorDetailDto.md)

## Example

```typescript
import type { HealthReadinessResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "status": ok,
  "details": null,
  "info": null,
  "error": null,
} satisfies HealthReadinessResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as HealthReadinessResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


