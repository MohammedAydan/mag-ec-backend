
# ExecuteReturnRefundDto


## Properties

Name | Type
------------ | -------------
`amount` | number
`reason` | string
`isOverride` | boolean
`overrideReason` | string

## Example

```typescript
import type { ExecuteReturnRefundDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "amount": null,
  "reason": null,
  "isOverride": null,
  "overrideReason": null,
} satisfies ExecuteReturnRefundDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ExecuteReturnRefundDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


