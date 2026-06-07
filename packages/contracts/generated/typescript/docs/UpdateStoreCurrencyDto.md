
# UpdateStoreCurrencyDto


## Properties

Name | Type
------------ | -------------
`currencyCode` | string
`symbol` | string
`minorUnit` | number

## Example

```typescript
import type { UpdateStoreCurrencyDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "currencyCode": null,
  "symbol": null,
  "minorUnit": null,
} satisfies UpdateStoreCurrencyDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UpdateStoreCurrencyDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


