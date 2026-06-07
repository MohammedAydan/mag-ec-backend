
# ManualTaxRateResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`taxClassId` | string
`countryCode` | string
`rateBps` | number
`isIncludedInPrice` | boolean
`updatedAt` | string

## Example

```typescript
import type { ManualTaxRateResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "taxClassId": null,
  "countryCode": null,
  "rateBps": null,
  "isIncludedInPrice": null,
  "updatedAt": null,
} satisfies ManualTaxRateResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ManualTaxRateResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


