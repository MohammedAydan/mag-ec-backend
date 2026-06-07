
# OrderReturnRequestItemDto


## Properties

Name | Type
------------ | -------------
`id` | string
`orderLineId` | string
`quantity` | number
`requestedDisposition` | string
`receivedQuantity` | number
`finalDisposition` | string
`warehouseId` | string
`reason` | string
`conditionNotes` | string
`restockedAt` | string

## Example

```typescript
import type { OrderReturnRequestItemDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "orderLineId": null,
  "quantity": null,
  "requestedDisposition": null,
  "receivedQuantity": null,
  "finalDisposition": null,
  "warehouseId": null,
  "reason": null,
  "conditionNotes": null,
  "restockedAt": null,
} satisfies OrderReturnRequestItemDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as OrderReturnRequestItemDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


