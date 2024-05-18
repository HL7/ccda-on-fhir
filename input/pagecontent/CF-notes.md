<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Notes FHIR → CDA](./FC-notes.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html).

...

### C-CDA to FHIR

|C-CDA¹<br/>[Note Activity](https://hl7.org/cda/us/ccda/2024Jan/StructureDefinition-NoteActivity.html)<br/>[DocumentReference](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-documentreference.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code|.type|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>**NOTE:** The root code in CDA is always `64109-9: Note` which matches the FHIR Binding.
|/text/@mediaType<br/>&<br/>/text/text()|.attachment.contentType<br/>&<br/>.attachment.data|If @mediaType is present, then representation should = B64, and the inner-text contents are embedded base64-encoded data. In this case, the mediaType and base64-encoded data map 1:1 to attachment.contentType and .data.
|/text/reference/@value|.attachment.contentType<br/>&<br/>.attachment.data|Convert the narrative element referenced by @value following [Narrative Text](mappingGuidance.html#narrative-text) guidance and use `application/xhtml+xml` as the contentType.<br/>If the narrative has minimal markup (i.e. only `<content>` and `<paragraph>` elements which can be converted to line breaks), it can be converted to `text/plain`.<br/>To send the raw CDA narrative without converting, use `application/cda+xml`, but this is less useful to receivers.
|/effectiveTime|.context.period|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/author|.author
|/author/time|.date|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/entryRelationship[@typeCode=COMP]/encounter<br/>or<br/>Parent `<encounter>` element<br/>or<br/>`<encompassingEncounter>`|.context.encounter|C-CDA requires an encounter for notes, but allows for context conduction. If the Note Activity is in an entryRelationship chain that includes an Encounter Activity, use that. Otherwise, if the document contains an `<encompassingEncounter>`, that is the encounter for the note.
|/reference/externalDocument/id|.relatesTo.target|*TODO: Appropriate?*



### Illustrative example
...
### Links to example content
...
### Prior work and Expanded Spreadsheets
...