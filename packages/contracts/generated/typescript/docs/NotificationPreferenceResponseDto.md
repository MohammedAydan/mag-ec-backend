
# NotificationPreferenceResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`userId` | string
`channel` | string
`orderConfirmations` | boolean
`orderShipments` | boolean
`orderDeliveries` | boolean
`returnStatusUpdates` | boolean
`reviewReplies` | boolean
`backInStock` | boolean
`lowStockAlerts` | boolean
`promotionalMessages` | boolean
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { NotificationPreferenceResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "userId": null,
  "channel": null,
  "orderConfirmations": null,
  "orderShipments": null,
  "orderDeliveries": null,
  "returnStatusUpdates": null,
  "reviewReplies": null,
  "backInStock": null,
  "lowStockAlerts": null,
  "promotionalMessages": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies NotificationPreferenceResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as NotificationPreferenceResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


