
# CheckoutPreviewDto


## Properties

Name | Type
------------ | -------------
`currencyCode` | string
`countryCode` | string
`items` | [Array&lt;CheckoutPreviewItemDto&gt;](CheckoutPreviewItemDto.md)
`customerLocale` | string
`customerId` | string
`couponCodes` | Array&lt;string&gt;

## Example

```typescript
import type { CheckoutPreviewDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "currencyCode": null,
  "countryCode": null,
  "items": null,
  "customerLocale": null,
  "customerId": null,
  "couponCodes": null,
} satisfies CheckoutPreviewDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CheckoutPreviewDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


