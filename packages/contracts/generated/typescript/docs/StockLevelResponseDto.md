
# StockLevelResponseDto


## Properties

Name | Type
------------ | -------------
`warehouseId` | string
`variantId` | string
`quantityAvailable` | number
`quantityReserved` | number
`quantityIncoming` | number
`warehouse` | [StockLevelWarehouseDto](StockLevelWarehouseDto.md)
`variant` | [StockLevelVariantDto](StockLevelVariantDto.md)

## Example

```typescript
import type { StockLevelResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "warehouseId": null,
  "variantId": null,
  "quantityAvailable": null,
  "quantityReserved": null,
  "quantityIncoming": null,
  "warehouse": null,
  "variant": null,
} satisfies StockLevelResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as StockLevelResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


