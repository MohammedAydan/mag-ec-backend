
# ShippingZoneResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`key` | string
`name` | string
`isActive` | boolean
`countryCodes` | Array&lt;string&gt;
`updatedAt` | string

## Example

```typescript
import type { ShippingZoneResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "key": null,
  "name": null,
  "isActive": null,
  "countryCodes": null,
  "updatedAt": null,
} satisfies ShippingZoneResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ShippingZoneResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


