
# ReturnRequestResponseDto


## Properties

Name | Type
------------ | -------------
`id` | string
`orderId` | string
`returnNumber` | string
`requestedByUserId` | string
`status` | string
`reason` | string
`createdAt` | string
`updatedAt` | string
`items` | [Array&lt;ReturnRequestItemResponseDto&gt;](ReturnRequestItemResponseDto.md)
`refunds` | [Array&lt;OrderRefundDto&gt;](OrderRefundDto.md)
`reviewedByUserId` | string
`receivedByUserId` | string
`notes` | string
`reviewNotes` | string
`rejectionReason` | string
`approvedAt` | string
`rejectedAt` | string
`receivedAt` | string
`closedAt` | string

## Example

```typescript
import type { ReturnRequestResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "orderId": null,
  "returnNumber": null,
  "requestedByUserId": null,
  "status": null,
  "reason": null,
  "createdAt": null,
  "updatedAt": null,
  "items": null,
  "refunds": null,
  "reviewedByUserId": null,
  "receivedByUserId": null,
  "notes": null,
  "reviewNotes": null,
  "rejectionReason": null,
  "approvedAt": null,
  "rejectedAt": null,
  "receivedAt": null,
  "closedAt": null,
} satisfies ReturnRequestResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ReturnRequestResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


