
# TopProductDto


## Properties

Name | Type
------------ | -------------
`productId` | string
`productName` | string
`sum` | [TopProductSumDto](TopProductSumDto.md)

## Example

```typescript
import type { TopProductDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "productId": null,
  "productName": null,
  "sum": null,
} satisfies TopProductDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TopProductDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


