
# CheckoutCartPreviewDto


## Properties

Name | Type
------------ | -------------
`cartId` | string
`currencyCode` | string
`countryCode` | string
`customerLocale` | string
`reserveStockOnPreview` | boolean

## Example

```typescript
import type { CheckoutCartPreviewDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "cartId": null,
  "currencyCode": null,
  "countryCode": null,
  "customerLocale": null,
  "reserveStockOnPreview": null,
} satisfies CheckoutCartPreviewDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CheckoutCartPreviewDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


