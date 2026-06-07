
# SalesSummaryResponseDto


## Properties

Name | Type
------------ | -------------
`orders` | [SalesSummaryMetricDto](SalesSummaryMetricDto.md)
`orderLines` | [SalesSummaryLinesMetricDto](SalesSummaryLinesMetricDto.md)
`refunds` | [SalesSummaryRefundsMetricDto](SalesSummaryRefundsMetricDto.md)

## Example

```typescript
import type { SalesSummaryResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "orders": null,
  "orderLines": null,
  "refunds": null,
} satisfies SalesSummaryResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as SalesSummaryResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


