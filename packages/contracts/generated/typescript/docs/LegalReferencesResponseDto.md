
# LegalReferencesResponseDto


## Properties

Name | Type
------------ | -------------
`terms` | [PublicLegalReferenceDto](PublicLegalReferenceDto.md)
`privacy` | [PublicLegalReferenceDto](PublicLegalReferenceDto.md)
`returns` | [PublicLegalReferenceDto](PublicLegalReferenceDto.md)
`shipping` | [PublicLegalReferenceDto](PublicLegalReferenceDto.md)

## Example

```typescript
import type { LegalReferencesResponseDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "terms": null,
  "privacy": null,
  "returns": null,
  "shipping": null,
} satisfies LegalReferencesResponseDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as LegalReferencesResponseDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


