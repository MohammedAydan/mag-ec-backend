
# SalesSummaryMetricDto


## Properties

Name | Type
------------ | -------------
`count` | [ReportingCountMetricDto](ReportingCountMetricDto.md)
`sum` | [SalesSummaryAmountSumDto](SalesSummaryAmountSumDto.md)

## Example

```typescript
import type { SalesSummaryMetricDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "count": null,
  "sum": null,
} satisfies SalesSummaryMetricDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as SalesSummaryMetricDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


