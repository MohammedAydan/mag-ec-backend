
# OrderShippingMethodDetailsDto


## Properties

Name | Type
------------ | -------------
`key` | string
`name` | string
`rateType` | string
`estimatedMinDays` | number
`estimatedMaxDays` | number

## Example

```typescript
import type { OrderShippingMethodDetailsDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "key": null,
  "name": null,
  "rateType": null,
  "estimatedMinDays": null,
  "estimatedMaxDays": null,
} satisfies OrderShippingMethodDetailsDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as OrderShippingMethodDetailsDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


