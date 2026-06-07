
# PromotionPerformanceDto


## Properties

Name | Type
------------ | -------------
`promotionId` | string
`key` | string
`name` | string
`source` | string
`count` | [ReportingCountMetricDto](ReportingCountMetricDto.md)
`sum` | [PromotionPerformanceSumDto](PromotionPerformanceSumDto.md)

## Example

```typescript
import type { PromotionPerformanceDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "promotionId": null,
  "key": null,
  "name": null,
  "source": null,
  "count": null,
  "sum": null,
} satisfies PromotionPerformanceDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PromotionPerformanceDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


