
# TranslationDto


## Properties

Name | Type
------------ | -------------
`locale` | string
`name` | string
`slug` | string
`description` | string

## Example

```typescript
import type { TranslationDto } from '@mag/generated-api-client'

// TODO: Update the object below with actual values
const example = {
  "locale": null,
  "name": null,
  "slug": null,
  "description": null,
} satisfies TranslationDto

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TranslationDto
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


