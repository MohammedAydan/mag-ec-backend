
# UpsertManualTaxRateDto


## Properties

Name | Type
------------ | -------------
`rateBps` | number
`isIncludedInPrice` | boolean

## Example

```typescript
import type { UpsertManualTaxRateDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "rateBps": null,
  "isIncludedInPrice": null,
} satisfies UpsertManualTaxRateDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UpsertManualTaxRateDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


