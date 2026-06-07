
# UpsertShippingZoneDto


## Properties

Name | Type
------------ | -------------
`name` | string
`countryCodes` | Array&lt;string&gt;
`isActive` | boolean

## Example

```typescript
import type { UpsertShippingZoneDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "name": null,
  "countryCodes": null,
  "isActive": null,
} satisfies UpsertShippingZoneDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UpsertShippingZoneDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


