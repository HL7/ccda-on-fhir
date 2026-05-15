Profile: USRealmHeader
Parent: $clinicaldocument
Id: US-Realm-Header
Title: "US Realm Header"
Description: "This profile defines constraints that represent common administrative and demographic concepts for US Realm clinical documents. Further specification, such as type, are provided in document profiles that conform to this profile."
* ^meta.versionId = "18"
* ^meta.lastUpdated = "2020-08-19T06:01:56.578+00:00"
* ^meta.source = "#bY1W9IGf5zWYeBRy"
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
* extension contains
    VersionNumber named version_number_extension 0..1 MS and
    DataEntererExtension named data_enterer_extension 0..1 MS and
    InformantExtension named informant_extension 0..* MS and
    InformationRecipientExtension named information_recipient_extension 0..* MS and
    ParticipantExtension named participant_extension 0..* MS and
    PerformerExtension named performer_extension 0..* MS and
    AuthorizationExtension named authorization_extension 0..* MS and
    OrderExtension named order_extension 0..* MS
* extension[informant_extension] ^label = "informant"
  * ^short = "informant"
* extension[information_recipient_extension] ^label = "informationRecipient"
  * ^short = "informationRecipient"
* extension[participant_extension] ^label = "participant"
  * ^short = "participant"
* extension[performer_extension] ^label = "performer"
  * ^short = "performer"
* extension[authorization_extension] ^label = "authorization"
  * ^short = "authorization"
* extension[order_extension] ^label = "authorization"
  * ^short = "authorization"
* identifier 1.. MS
  * ^short = "identifier"
* type MS
* subject only Reference($us-core-patient or Group)
* subject MS
* encounter only Reference($us-core-encounter)
* encounter MS
* date MS
  * ^short = "date"
* author only Reference($us-core-practitioner or $us-core-practitionerrole or PractitionerRole or $us-core-patient or Device or RelatedPerson)
* author MS
* title MS
  * ^label = "Document Title"
  * ^short = "Document Title"
* confidentiality 0..0
  * ^label = "Use the confidentiality codes in Meta.security"
  * ^short = "Use the confidentiality codes in Meta.security"
  * ^definition = "Use the confidentiality codes in Meta.security (https://hl7.org/fhir/security-labels.html)"
  * ^mustSupport = false
* attester ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "mode"
  * ^slicing.rules = #open
  * ^mustSupport = false
* attester contains
    legal_attester 0..1 MS and
    professional_attester 0..* MS and
    personal_attester 0..* MS
* attester[legal_attester] ^short = "attester"
  * mode ..1 MS
  * mode = #legal (exactly)
    * ^short = "mode"
  * party 1.. MS
  * party only Reference($us-core-practitioner or $us-core-practitionerrole)
    * ^short = "party"
* attester[professional_attester] ^short = "attester"
  * mode = #professional (exactly)
  * mode MS
    * ^short = "mode"
  * party 1.. MS
  * party only Reference($us-core-practitioner or $us-core-practitionerrole)
    * ^short = "party"
* attester[personal_attester] ^short = "attester"
  * mode = #personal (exactly)
  * mode MS
    * ^short = "mode"
  * party 1.. MS
  * party only Reference($us-core-patient or RelatedPerson)
    * ^short = "party"
* custodian 1.. MS
* custodian only Reference($us-core-organization)
  * ^label = "custodian"
  * ^short = "custodian"