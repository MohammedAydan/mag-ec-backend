
# InventoryKpisResponseDto


## Properties

Name | Type
------------ | -------------
`stock` | [InventoryKpisStockMetricDto](InventoryKpisStockMetricDto.md)
`warehouses` | number

## Example

```typescript
import type { InventoryKpisResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "stock": null,
  "warehouses": null,
} satisfies InventoryKpisResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as InventoryKpisResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


