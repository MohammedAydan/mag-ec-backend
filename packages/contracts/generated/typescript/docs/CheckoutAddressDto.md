
# CheckoutAddressDto


## Properties

Name | Type
------------ | -------------
`recipientName` | string
`phoneNumber` | string
`countryCode` | string
`city` | string
`addressLine1` | string
`state` | string
`postalCode` | string
`addressLine2` | string
`company` | string

## Example

```typescript
import type { CheckoutAddressDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "recipientName": null,
  "phoneNumber": null,
  "countryCode": null,
  "city": null,
  "addressLine1": null,
  "state": null,
  "postalCode": null,
  "addressLine2": null,
  "company": null,
} satisfies CheckoutAddressDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CheckoutAddressDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


