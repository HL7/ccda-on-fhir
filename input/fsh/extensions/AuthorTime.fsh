Extension: AuthorTime
Id: author-time
Title: "Author Time"
Description: "The point in time of a document-level author's participation (CDA ClinicalDocument/author/time, constrained to a single point in time in CDA R2). This extension applies to the header author participation only; entry-level author times map to resource-native elements such as MedicationRequest.authoredOn. Each Composition.author reference carries its own time."
Context: Composition.author
* ^status = #active
* ^jurisdiction = urn:iso:std:iso:3166#US
* value[x] only dateTime
* value[x] 1..1
