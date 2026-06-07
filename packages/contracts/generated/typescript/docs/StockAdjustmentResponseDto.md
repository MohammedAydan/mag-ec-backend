
# StockAdjustmentResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`warehouseId` | string
`variantId` | string
`type` | string
`quantityChanged` | number
`createdAt` | string
`referenceType` | string
`referenceId` | string
`actorUserId` | string

## Example

```typescript
import type { StockAdjustmentResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "warehouseId": null,
  "variantId": null,
  "type": null,
  "quantityChanged": null,
  "createdAt": null,
  "referenceType": null,
  "referenceId": null,
  "actorUserId": null,
} satisfies StockAdjustmentResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as StockAdjustmentResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


