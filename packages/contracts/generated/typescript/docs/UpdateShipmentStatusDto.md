
# UpdateShipmentStatusDto


## Properties

Name | Type
------------ | -------------
`status` | string
`trackingNumber` | string
`trackingUrl` | string
`notes` | string

## Example

```typescript
import type { UpdateShipmentStatusDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "status": null,
  "trackingNumber": null,
  "trackingUrl": null,
  "notes": null,
} satisfies UpdateShipmentStatusDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UpdateShipmentStatusDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


