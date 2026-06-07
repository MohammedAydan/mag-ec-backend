
# UpdatePricingBehaviorDto


## Properties

Name | Type
------------ | -------------
`pricesIncludeTax` | boolean
`defaultTaxCountryCode` | string
`shippingCurrencyCode` | string

## Example

```typescript
import type { UpdatePricingBehaviorDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "pricesIncludeTax": null,
  "defaultTaxCountryCode": null,
  "shippingCurrencyCode": null,
} satisfies UpdatePricingBehaviorDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UpdatePricingBehaviorDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


