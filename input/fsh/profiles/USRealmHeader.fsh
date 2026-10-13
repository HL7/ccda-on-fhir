Profile: USRealmHeader
Parent: $clinical-document-composition
Id: US-Realm-Header
Title: "US Realm Header"
Description: "This profile defines constraints that represent common administrative and demographic concepts for US Realm clinical documents produced by a C-CDA to FHIR transform. It derives from the FHIR Clinical Document Composition profile and asserts only the US Realm delta. Further specification, such as type, is provided in document profiles that conform to this profile."
* ^status = #active
* ^contact.name = "Rick Geimer"
* ^contact.telecom[0].system = #phone
* ^contact.telecom[=].value = "206-592-2443"
* ^contact.telecom[=].use = #work
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "rick.geimer@lantanagroup.com"
* ^contact.telecom[=].use = #work
* ^jurisdiction = urn:iso:std:iso:3166#US
* ^abstract = true
* language 1.. MS
  * ^short = "language"
// Participation extensions are inherited from FHIR Clinical Documents; flagged MS here.
* extension[data-enterer] MS
* extension[informant] MS
  * ^label = "informant"
* extension[information-recipient] MS
  * ^label = "informationRecipient"
* extension[participant] MS
  * ^label = "participant"
* extension[consent] MS
  * ^label = "authorization"
* extension[basedOn] MS
  * ^label = "order"
* extension contains PerformerExtension named performer_extension 0..* MS
* extension[performer_extension] ^label = "performer"
  * ^short = "performer"
// Composition.identifier carries ClinicalDocument.setId (when present); the document id
// maps to Bundle.identifier. R4 Composition.identifier is 0..1, so both cannot be carried.
* identifier MS
  * ^short = "setId of the source document; the document id maps to Bundle.identifier"
* subject only Reference($us-core-patient or Group)
* subject MS
* encounter only Reference($us-core-encounter)
* encounter MS
* author only Reference($us-core-practitioner or $us-core-practitionerrole or PractitionerRole or $us-core-patient or Device or RelatedPerson)
* author.extension contains AuthorTime named author-time 0..1 MS
* author.extension[author-time] ^short = "Time of the author's participation (CDA author/time)"
// Attester slices legal_attester and professional_attester are inherited from FCD;
// US Realm constrains their parties and adds the personal attester.
* attester[legal_attester] MS
  * party 1.. MS
  * party only Reference($us-core-practitioner or $us-core-practitionerrole)
* attester[professional_attester] MS
  * party 1.. MS
  * party only Reference($us-core-practitioner or $us-core-practitionerrole)
* attester contains personal_attester 0..* MS
* attester[personal_attester] ^short = "attester"
  * mode = #personal (exactly)
  * mode MS
  * party 1.. MS
  * party only Reference($us-core-patient or RelatedPerson)
* custodian 1.. MS
* custodian only Reference($us-core-organization)
  * ^label = "custodian"
  * ^short = "custodian"
