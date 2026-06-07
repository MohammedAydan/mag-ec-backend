
# StockReservationResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`warehouseId` | string
`variantId` | string
`quantity` | number
`status` | string
`createdAt` | string
`warehouse` | [StockReservationWarehouseDto](StockReservationWarehouseDto.md)
`variant` | [StockReservationVariantDto](StockReservationVariantDto.md)
`expiresAt` | string
`user` | [StockReservationUserDto](StockReservationUserDto.md)

## Example

```typescript
import type { StockReservationResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "warehouseId": null,
  "variantId": null,
  "quantity": null,
  "status": null,
  "createdAt": null,
  "warehouse": null,
  "variant": null,
  "expiresAt": null,
  "user": null,
} satisfies StockReservationResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as StockReservationResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


