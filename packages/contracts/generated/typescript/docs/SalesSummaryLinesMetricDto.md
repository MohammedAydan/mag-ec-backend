
# SalesSummaryLinesMetricDto


## Properties

Name | Type
------------ | -------------
`count` | [ReportingCountMetricDto](ReportingCountMetricDto.md)
`sum` | [SalesSummaryLinesSumDto](SalesSummaryLinesSumDto.md)

## Example

```typescript
import type { SalesSummaryLinesMetricDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "count": null,
  "sum": null,
} satisfies SalesSummaryLinesMetricDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as SalesSummaryLinesMetricDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


