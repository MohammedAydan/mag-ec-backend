
# CheckoutPreviewAppliedPromotionDto


## Properties

Name | Type
------------ | -------------
`promotionId` | string
`key` | string
`name` | string
`rewardType` | string
`discountAmount` | number
`freeShipping` | boolean
`source` | string
`couponCode` | string

## Example

```typescript
import type { CheckoutPreviewAppliedPromotionDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "promotionId": null,
  "key": null,
  "name": null,
  "rewardType": null,
  "discountAmount": null,
  "freeShipping": null,
  "source": null,
  "couponCode": null,
} satisfies CheckoutPreviewAppliedPromotionDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CheckoutPreviewAppliedPromotionDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


