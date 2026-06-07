
# StockMovementItemDto


## Properties

Name | Type
------------ | -------------
`id` | string
`type` | string
`quantityChanged` | number
`createdAt` | string
`variant` | [StockMovementVariantDto](StockMovementVariantDto.md)
`warehouse` | [StockMovementWarehouseDto](StockMovementWarehouseDto.md)
`referenceType` | string
`referenceId` | string
`actorUser` | [StockMovementActorDto](StockMovementActorDto.md)

## Example

```typescript
import type { StockMovementItemDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "type": null,
  "quantityChanged": null,
  "createdAt": null,
  "variant": null,
  "warehouse": null,
  "referenceType": null,
  "referenceId": null,
  "actorUser": null,
} satisfies StockMovementItemDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as StockMovementItemDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


