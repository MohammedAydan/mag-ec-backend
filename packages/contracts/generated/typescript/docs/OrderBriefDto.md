
# OrderBriefDto


## Properties

Name | Type
------------ | -------------
`orderNumber` | string
`paymentStatus` | string
`status` | string

## Example

```typescript
import type { OrderBriefDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "orderNumber": null,
  "paymentStatus": null,
  "status": null,
} satisfies OrderBriefDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as OrderBriefDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


