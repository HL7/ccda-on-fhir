<link rel="stylesheet" href="colors.css">

This page provides mappings from the C-CDA `ClinicalDocument` header to FHIR document artifacts (Composition and, in a document Bundle, the Bundle wrapper). For participation elements (author, informant, performer, and others), see [Participation](CF-participations.html); for recordTarget, see [Patient](CF-patient.html); for encompassingEncounter, see [Encounters](CF-encounters.html).

### C-CDA to FHIR (Composition / Bundle)

|C-CDA¹<br>[US Realm Header](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-USRealmHeader.html)|FHIR<br>[Composition (US Realm Header profile)](StructureDefinition-US-Realm-Header.html)|Transform Steps|
|:----|:----|:----|
|/id|Bundle.identifier &<br/>.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/code|.type|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/title|.title||
|/effectiveTime|.date|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|/confidentialityCode|.confidentiality||
|/languageCode|.language||
|/setId & /versionNumber|.identifier + version extension|Cross-version `Composition.version` extension (see profile)|
|/recordTarget|subject → **Patient**|See [Patient](CF-patient.html)|
|/author|.author + **Provenance**|See [Participation](CF-participations.html)|
|/custodian|.custodian → **Organization**||
|/legalAuthenticator|.attester (mode=legal)||
|/authenticator|.attester (mode=professional)||
|/documentationOf/serviceEvent|.event (code, period)||
|/componentOf/encompassingEncounter|.encounter → **Encounter**|See [Encounters](CF-encounters.html)|
|/relatedDocument|.relatesTo||
|/component/structuredBody/section|.section (code, title, text, entry references)|Section content: see the per-domain pages|

1\. In a FHIR document Bundle, the Composition is the first entry and all referenced resources must be contained in the Bundle (see the document profiles).

### Example

The example below is generated from the canonical Myra Jones CCD header and the published Composition example (Continuity of Care Document profile), verified on every build. The structuredBody is elided — its entries are shown on the per-domain pages, and the Composition's sections reference the same shared instances. Header elements absent from the Myra source (setId/versionNumber, legalAuthenticator, dataEnterer, informant, relatedDocument) are not yet demonstrated; see the decision log.

{% include examples/CF-header-example.xhtml %}
