
# SalesSummaryAmountSumDto


## Properties

Name | Type
------------ | -------------
`grandTotalAmount` | number
`subtotalAmount` | number
`taxAmount` | number
`shippingAmount` | number

## Example

```typescript
import type { SalesSummaryAmountSumDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "grandTotalAmount": null,
  "subtotalAmount": null,
  "taxAmount": null,
  "shippingAmount": null,
} satisfies SalesSummaryAmountSumDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as SalesSummaryAmountSumDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


