<style>
td, th {
   border: 1px solid black!important;
}
</style>

### Reading the C-CDA ↔ FHIR Mapping Tables 

#### How to Read Mapping Tables and Transform Steps? 

The header row of the mapping table provides links to the respective profiles in FHIR (e.g. **[US Core AllergyIntolerance](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-allergyintolerance.html)**) and templates in C-CDA (e.g. **[Allergy Intolerance observation](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.4.7.html)**)and specifies the "base" that each of the rows will build one.  All FHIR elements use a simplified dot notation and the CDA elements use simplified slash notation. Always use the underlying standards, provided via header row links, to ensure conformance when building FHIR resource or C-CDA clinical documents. 

Rather than repeating cardinality, conformance, and other criteria from FHIR Resources or a C-CDA templates defined outside this implementaiton guide, external references are shown in tables as bold hyperlinks (e.g. **[US Core Patient](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-patient.html)** or **[C-CDA US Realm Header](http://hl7.org/cda/stds/ccda/draft1/StructureDefinition-2.16.840.1.113883.10.20.22.1.1.html)**). Unbold links refer to guidance contained within this guide (e.g. [CDA ↔ FHIR Name, Address, and Telecom mapping](mappingGuidance.html#name-address-telecom))


The "Transform Steps" column of the table will provide guidance for mapping content between C-CDA and FHIR, those steps will be listed in the following order: 

1. **Constraint (labeled in bold)**: Only perform the action when this constraint is fulfilled
2. **Structural Guidance (Bidirectional guidance shown as ↔)**: Generalized narrative guidance on structural transform between CDA and FHIR elements. This links to sections on this current page
3. **ConceptMap (Terminology mapping direction shown as →)**: Link to a computable map between CDA and FHIR vocabularies. This links to [conceptMaps developed in this guide](conceptMaps.html)
4. **Notes (no label)**: Other notes specific to this element mapping


#### What Examples are Included?

Examples for C-CDA to FHIR transforms are provided based on a consensus of various vendors performing mappings. All vendors received the sample input (e.g. C-CDA Document) and generated output (e.g. FHIR Resource) which were then iterated through group discussion to a consensus. For FHIR to C-CDA, a single vendor provided examples which are included. 

The highlighted output images were created using an [open source tool for C-CDA ↔ FHIR Mapping](https://github.com/jddamore/cda-fhir-compare) developed as part of this project.  

### Structural Guidance

#### CDA id ↔ FHIR identifier

Identifiers in both FHIR and CDA can divide the identifier value from its namespace: FHIR as the identifier.system and CDA as the id.root. In many cases, this correspondence works well.

However, the FHIR system can be any URI, including OIDs & UUIDs as well as URLs. CDA roots must be UIDs, which consist of OIDs and UUIDs only. CDA roots can often be used as FHIR systems, but FHIR systems must often be translated. In some cases, the URL has a registered equivalent OID, for example, an identifier with a FHIR system of http://hl7.org/fhir/sid/us-ssn can be represented with a CDA root of 2.16.840.1.113883.4.1.

If there is no such OID, and if the FHIR identifier is a URL, we can use the URL specification itself as the system, and that specification - urn:ietf:rfc:3986 - has a registered OID equivalent, 2.16.840.1.113883.4.873. The FHIR identifier.value can be appended to the system for the CDA extension. These ids can be represented as below.

Cases where the FHIR system uses a scheme with no OID present a problem. The UID type is primitive, represented only as an XML attribute, and it cannot have a null flavor. One solution may be to generate a UUID, but expectations around the UUID's persistence and recognizability may vary.

##### CDA id → FHIR Identifier with Example Mapping

|Case|Approach|CDA id@root|CDA id@extension|identifier.system|identifier.value|
|:--|:--|:--|:--|:--|:--|
|URL exists|translate|2.16.840.1.113883.4.1|123-45-6789|http://hl7.org/fhir/sid/us-ssn|123-45-6789
|No URL exists|use OID|2.16.840.1.113883.4.500|12345V7890|urn:oid:2.16.840.1.113883.4.500|12345V7890
|No URL exists and no extension<sup>1</sup>|use URI system, prepend with urn:uuid:|2.16.840.1.123.4.50.123456789||urn:ietf:rfc:3986|urn:oid:2.16.840.1.123.4.50.123456789
|UUID-only|use URI system, prepend with urn:oid:|67265ED2-35BB-43F8-B9DE-91C5935625E0<sup>2</sup>||urn:ietf:rfc:3986|urn:uuid:67265ed2-35bb-43f8-b9de-91c5935625e0<sup>2</sup>
|UUID with extension<sup>3</sup>|use UUID, prepend value|67265ED2-35BB-43F8-B9DE-91C5935625E0|abcd|urn:uuid:67265ed2-35bb-43f8-b9de-91c5935625e0|abcd
|Extension-only|only set value||Z1124||Z1124
|Root = URI OID, Value = URL|split value on /|2.16.840.1.113883.4.873<sup>4</sup>|http://myorg.com/patient/1234|http://myorg.com/patient|1234
|Root = URI OID, Value = URN|split value on :|2.16.840.1.113883.4.873<sup>4</sup>|urn:myNID:myOrg:Z3321|urn:myNID:myOrg|Z3321

1. This approach should not be used for known identifier systems like SSN or NPI. Even if there is no nullFlavor, sending the system OID as a value is inappropriate.
2. UUIDs from CDA are uppercase (per Abstract Datatypes 2.1.5.1); UUIDs from FHIR are lowercase (per [FHIR uri Datatype](https://hl7.org/fhir/R4/datatypes.html#uri)). Transform case when converting.
3. UUID's are unique by themselves and rarely have extensions, so this scenario is rare.
4. This is the URN OID equivalent of urn:ietf:rfc:3598. These examples are the reverse of the concatenation example listed below.

If a CDA id contains a `@nullFlavor` (or a known coding system such as SSN or NPI with no extension), a FHIR Identifier may be created using a data-absent-reason extension explaining the missing data. If the CDA id has a `@root`, place the extension on the `Identifier.value` element (for example, to indicate an unknown NPI); if the CDA id has only a `@nullFlavor`, the extension may be placed on the Identifier element itself.

##### FHIR Identifier → CDA id with Example Mapping

|Case|Approach|identifier.system|identifier.value|CDA id@root|CDA id@extension|
|:--|:--|:--|:--|:--|:--|
|OID exists|translate|http://hl7.org/fhir/sid/us-ssn|123-45-6789|	2.16.840.1.113883.4.1|123-45-6789
|OID value|use OID as root|urn:ietf:rfc:3986|urn:oid:2.16.840.1.123.4.50.123456789|2.16.840.1.123.4.50.123456789|
|UUID value|use UUID as root|urn:ietf:rfc:3986|urn:uuid:67265ed2-35bb-43f8-b9de-91c5935625e0|67265ED2-35BB-43F8-B9DE-91C5935625E0
|No OID exists|concatenate; use URL specification URI for root|http://www.myOrg.com/patients|123456789|2.16.840.1.113883.4.873 <br/> (OID for urn:ietf:rfc:3986)|http://www.myOrg.com/patients/123456789
|No OID exists|concatenate; use URL specification URI for root|urn:myNID:myOrganization|123456789|2.16.840.1.113883.4.873|urn:myNID:myOrganization:123456789
|OID in system|remove prefix|urn:oid:2.16.840.1.113883.4.500|12345V7890|2.16.840.1.113883.4.500|12345V7890
|One-value pattern|introspect steward organization OID||123456789|2.16.840.1.113883.4.349|123456789

In some cases, a CDA template requires an id, and the source FHIR resource may not have an identifier. In these cases, use of nullFlavor or UUID generation approach may be reasonable options.

##### FHIR ids

FHIR ids (i.e. resource ids and element ids) are strings: they have no system. We propose not preserving them. They could be used in II.extension but we have no way to identify a root. If someone can ascertain a reliable, repeatable way to do that, we might be able to keep the id.

#### CDA ↔ FHIR Time/Dates

CDA timestamp values are based on a pattern of YYYYMMDDHHmmss+zzzz and [FHIR dateTime values](https://hl7.org/fhir/datatypes.html#dateTime) are based on a YYYY-MM-DDThh:mm:ss+zz:zz. Partial expressions (e.g. 202305 for CDA or 2023-05 for FHIR) are allowed in both standards. 

To convert between the standards, systems should deploy programming logic that converts formats and preserves the level of precision. For example, "20230531" from CDA would become "2023-05-31" in FHIR (not 2023-05-31T00:00:00+00:00). Additional examples below: 

|CDA Date Time|FHIR Date Time|
|:-----|:-----|:-------------|
|2023|2023|
|202305|2023-05|
|20230531|2023-05-31|
|202305312205-0500|2023-05-31T22:05-05:00|

Note that in C-CDA timezone offset is a SHOULD, while in FHIR, time zone offset is required when more specific than the day. There may be instances where a CDA date-time value omits a time zone offset and other data from the document may be necessary to populate FHIR dateTime requirements.

The following are possible approaches to map CDA timestamps without offset to a FHIR dateTime or instant datatype. Selecting an approach depends on various factors including the criticality of the data, the age of the document, and the level of information the transformation process has about the location where the particular element was recorded.

- Omit the time portion of the date entirely, optionally sending the time as an extension or use the [Uncertain period  extension](http://hl7.org/fhir/extensions/StructureDefinition-uncertainPeriod.html)
  - Note - this only works for FHIR fields with a dateTime datatype; the instant datatype must be precise to the second
- Use the same offset as a different timestamp within the same entry or section (or ClinicalDocument/effectiveTime)
- Use contextual knowledge of the source document's location (e.g. if the document came from a health system serving only New England and the date was in December, the offset is likely "-05:00")
- Default the offset to 00:00

Beware that any approach which manufactures an offset could have clinical implications, but this is likely less critical the older (and thus, more likely to be missing offsets) the document is.

#### CDA Coding ↔ FHIR CodeableConcept

The structure for coding in CDA and FHIR are fundamentally different. CDA  employs a mechanism (xsi:type [CD](http://hl7.org/cda/stds/core/draft1/StructureDefinition-CD.html) or [CE](http://hl7.org/cda/stds/core/draft1/StructureDefinition-CE.html)) where the code is included in the element and then originalText and translations elements may be provided as child elements. In FHIR, [CodeableConcept](http://hl7.org/fhir/datatypes.html#codeableconcept) places all codes in a coding list with a separate element for the text representation. 

##### CDA Coding → FHIR CodeableConcept

|CDA Property|FHIR Target|Notes|
|:-----|:-----|:-------------|
|@code|coding.code||
|@codeSystem|coding.system|Requires [mapping OID → URL](mappingGuidance.html#mapping-oid--url) or adding `urn:oid:` prefix|
|@displayName|coding.display|
|originalText|text|CDA references must be resolved since [text](http://hl7.org/fhir/datatypes-definitions.html#CodeableConcept.text) is a string in FHIR|
|translation@code|coding.code||
|translation@codeSystem|coding.system|Requires [mapping OID → URL](mappingGuidance.html#mapping-oid--url) or adding `urn:oid:` prefix|
|translation@displayName|coding.display|

##### FHIR CodeableConcept → CDA Coding

In addition to the context of the previous section, CDA often requires elements to be present but the usage of a null value (@nullFlavor) is allowed. Generally when a CDA element is required (i.e. SHALL [1..1]), implementers will need to do one of the following when converting data into CDA: 
- If the data fulfills the target valueset, use the code and translate system
- If the data can be mapped into the target valueset, use a mapping and the translated system
- When the above is not possible:
  - If you have coded data and CDA nullFlavor is allowed, use "OTH" and put the source data in translation and provide originalText if possible. Note that [CD](http://hl7.org/cda/stds/core/draft1/StructureDefinition-CE.html) and [CE](http://hl7.org/cda/stds/core/draft1/StructureDefinition-CE.html) CDA elements generally allow translation and originalText. 
  - If you have missing data with [data-absent-reason](https://hl7.org/fhir/extension-data-absent-reason.html), use a [mapped nullFlavor](ConceptMap-FC-DataAbsentReasonNullFlavor.html) if allowed. If not allowed, find the best match in the permitted valueset. 
  - If you have missing data without [data-absent-reason](https://hl7.org/fhir/extension-data-absent-reason.html), select a nullFlavor if allowed. If not allowed, find the best match in the permitted valueset. 

|FHIR Property|CDA Target|Notes|
|:-----|:-----|:-------------|
|coding.code|@code<br/>or<br/>translation@code|The criteria for mapping to @code varies by valueset binding within CDA templates. When no coding.code matches the target valueset, the @code should be omitted and @nullFlavor="OTH" used placing all coding as translation elements|
|coding.display|coding.displayName<br/>or<br/>translation@displayName|
|coding.system|@codeSystem<br/>or<br/>translation@codeSystem|Requires [URL → OID mapping](mappingGuidance.html#mapping-oid--url) or removing `urn:oid:` prefix|
|text|originalText|

##### Mapping OID ↔ URL

FHIR requires that certain terminologies use a specific uniform resource locator (URL) while CDA always uses object identifiers (OIDs) for codeSystems. This means: 
  - For CDA → FHIR mapping
    - Translation to URLs is required for [select OIDs defined here](http://hl7.org/fhir/terminologies-systems.html)
    - For OIDs not in the above list and where no URL equivalent is known, add the `urn:oid:` prefix to OID
  - For FHIR → CDA mapping
     - Translation or URLs to OIDs is always required for FHIR → CDA mapping
     - Removal or `urn:oid:` prefix for OIDs

Two example are shown in the table below. Since LOINC is a terminology with a defined URL in FHIR, it is not allowed to add `urn:oid:` when mapping from CDA (~~urn:oid:2.16.840.1.113883.6.1~~). This is allowed, however, for other terminologies where no URL is known. 

|CDA @codeSystem|FHIR coding.system|
|:----|:----|
|2.16.840.1.113883.6.1|http://loinc.org|
|2.16.840.1.113883.4.123456789|urn:oid:2.16.840.1.113883.4.123456789|

Additional guidance on [FHIR terminologies available here](http://hl7.org/fhir/terminologies-systems.html)

##### Text Linking in CDA and FHIR 

CDA has one mechanism for references; FHIR has two: the [narrativeLink extension](http://hl7.org/fhir/R4B/extension-narrativelink.html) and the [originalText extension](http://hl7.org/fhir/R4B/extension-originaltext.html). Since CDA does not distinguish between the "original" and "representation" cases, we use the more general "representation" (narrativeLink) extension for these maps. Note also that the CDA use of reference points to generated text, which may not fit the definition of "original."

CDA referenced typically point to section/text which may include embedded lists or tables. Issues with text reference technical capabilities are not addressed here (e.g., referencing a table row without an agreed convention for identifying table header data).

Implementers transforming a CDA document may wish to dereference the text and provide it in the target FHIR resource as text. This is appropriate, but we do not provide instructions for doing so. Implementers may also provide referenced text along with the reference. 

#### CDA ↔ FHIR Provenance

CDA provides a repeated set of elements within each activity which may be used in populating data to/from FHIR [Provenance.Agent](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-provenance.html)  

- **author**: Represents the humans and/or machines that authored the [document/section/entry/act]. 
- **performer**: A person who actually and principally carries out an action.
- **informant**: An informant (or source of information) is a person that provides relevant information, such as the parent of a comatose patient who describes the patient's behavior prior to the onset of coma.
- **participant** Used to represent other participants not explicitly mentioned by other classes, that were somehow involved in the documented activities

FHIR, however, provides different elements within resources (e.g. Condition.recorder) that convey some information on provenance and a dedicated [Provenance resource](http://hl7.org/fhir/R4/provenance.html) which references a  target resource. In addition, FHIR documents do not provide context conduction, so all FHIR resources in a FHIR document should have explicit [Provenance](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-provenance.html). 

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<blockquote class="stu-note">
		<b>Provenance Mapping</b>
		<p>This publication does <b>not</b> provide definitive CDA ↔ FHIR guidance on when resource attributes (e.g. AllergyIntolerance.recorder) vs. dedicated Provenance resources (e.g. Provenance targeting an AllergyIntolerance resource) should be used for documenting data provenance.</p>
    <p>In addition, this guide does not address how author and other provenance context conduction should work from C-CDA to FHIR. We welcome feedback on the topic of provenance from implementers.</p>
	</blockquote>
</div>

At a minimum, it is recommended that when [Provenance](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-provenance.html) resources are present in a FHIR document, that they should be mapped to provenance as defined in the [C-CDA Companion Guide](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=447). 

Preliminary guidelines for documents may include: 
1. Assembler generated documents
    - `entity.what` reference either a [DocumentReference](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-documentreference.html) or [DiagnosticReport](https://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-note.html)
    - `agent.type.coding.code` = assembler
    - `agent.onBehalfOf` reference the [Organization](https://hl7.org/fhir/us/core/StructureDefinition-us-core-organization.html) that the document was assembled under the auspices of
2. Device generated document templates
    - `entity.what` reference either a [DocumentReference](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-documentreference.html) or [DiagnosticReport](https://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-note.html)
    - `agent.type.coding.code` = assembler
    - `agent.onBehalfOf` reference the [Organization](https://hl7.org/fhir/us/core/StructureDefinition-us-core-organization.html) that the document was assembled under the auspices of
    - A role of Informant is not permitted in Device Generated Document template. 
3. Patient Generated Document
    - `entity.what` reference either a [DocumentReference](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-documentreference.html) or [DiagnosticReport](https://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-note.html)
    - `agent.type` of author
    - `agent.who` reference to the [Patient](https://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html). Optionally, it may include a participating device composer when created from a patient portal, and/or a participating assembeler; or a participating informant.
    - `onBehalfOf` valued to the authorizing provider's organization
4. Provider Generated Document
    - `entity.what` reference either a [DocumentReference](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-documentreference.html) or [DiagnosticReport](https://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-note.html)
    - `agent.type` of author
    - `agent.who` reference the [Practitioner](https://hl7.org/fhir/us/core/StructureDefinition-us-core-practitioner.html) or [PractitionerRole](https://hl7.org/fhir/us/core/StructureDefinition-us-core-practitionerrole.html) (when organization is included along with roles form the source C-CDA)
    - `onBehalfOf` reference to an [Organization](https://hl7.org/fhir/us/core/StructureDefinition-us-core-organization.html) that the provider is authorized by



#### Name, Address, Telecom ####

The mappings of name, address and telecom information is useful in many part of C-CDA ↔ FHIR mapping. These are a combination of string, code and date mappings as shown below and may be re-used across many templates/resources.  For examples of these transformations, please see the [CDA → FHIR Patient mapping](./CF-patient.html) and [FHIR → CDA Patient mapping](./FC-patient.html) pages.

##### CDA name → FHIR name #####

|CDA name|FHIR name|Transform Steps
|:-----|:-----|:---------
|@use|.use|[Name use (CDA) → Name use (FHIR)](./ConceptMap-CF-NameUse.html)
|prefix|.prefix|
|given|.given|
|family|.family|
|suffix|.suffix|
|validTime/low@value|.period.start|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|validTime/high@value|.period.end|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)

##### CDA addr → FHIR address #####

|CDA addr|FHIR address|Transform Steps
|:-----|:-----|:---------
|@use|.use|[Addr use  (CDA) → Address use (FHIR)](./ConceptMap-CF-AddressUse.html)
|streetAddressLine|.line|
|city|.city|
|state|.state|
|postalCode|.postalCode|
|country|.country|
|useablePeriod/low@value|.period.start|
|useablePeriod/high@value|.period.end|

##### CDA telecom → FHIR telecom #####

|CDA telecom|FHIR telecom|Transform Steps
|:-----|:-----|:---------
|@use|.use|[CDA telecom use → FHIR contact point use](./ConceptMap-CF-TelecomUse.html)|
|@value|.system<br/>&<br/>.value|[CDA telecom value → FHIR contact point system](./ConceptMap-CF-TelecomType.html)<br/>Only include information in FHIR value which comes after the CDA system prefix|

##### FHIR name → CDA name #####

|FHIR name|CDA name|Transform Steps
|:-----|:-----|:---------
|.use|@use|[Name use (FHIR) → Name use (CDA)](./ConceptMap-FC-NameUse.html)|
|.family|family|
|.given|given|
|.prefix|prefix|
|.suffix|suffix|
|.period.start|validTime/low@value|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.period.end|validTime/high@value|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|

##### FHIR address  → CDA addr #####

|FHIR address|CDA addr|Transform Steps
|:-----|:-----|:---------
|.use|@use|[Address use (FHIR) → Addr use (CDA)](./ConceptMap-FC-AddressUse.html)|
|.line|streetAddressLine|
|.city|city|
|.state|state|
|.postalCode|postalCode|
|.country|country|
|.period.start|useablePeriod/low@value|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|
|.period.end|useablePeriod/high@value|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)|

##### FHIR telecom → CDA telecom #####

|FHIR telecom|CDA telecom|Comments
|:-----|:-----|:---------
|.system<br/>&<br/>.value |@value|[FHIR contact point system → CDA telecom value](./ConceptMap-FC-TelecomType.html)<br/>Insert FHIR value after the CDA system prefix mapped from FHIR system|
|.use|@use|[FHIR contact point use → CDA use](./ConceptMap-FC-TelecomUse.html)|

#### Missing Data in C-CDA vs. FHIR ####

CDA and FHIR address missing data and null usage in different ways:  
- The use of nullFlavor in CDA is explained in depth in Volume 1 of the [C-CDA Implementation Guide](http://hl7.org/cda/stds/ccda/draft1/designconsiderations.html#unknown-and-no-known-information) and in the [C-CDA Companion Guide](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=447). 
- The use of the data absent reason extension is explained in depth in the [US Core Implementation Guide](https://build.fhir.org/ig/HL7/US-Core/general-requirements.html#missing-data) and also in the [base extension](http://hl7.org/fhir/extension-data-absent-reason.html).

In this publication, we include a mapping between missing data concepts. **Importantly, it should be noted that several mappings include non-equivalence (wider or narrower or unsupported) and that each standard may allow data elements to be omitted while the other requires**. Feedback to improve implementer guidance is welcome on the handling of missing data between C-CDA and FHIR:
- [NullFlavor (CDA) → Data Absent Reason code (FHIR)](./ConceptMap-CF-NullFlavorDataAbsentReason.html) 
- [Data Absent Reason code (FHIR) → NullFlavor (CDA)](./ConceptMap-FC-DataAbsentReasonNullFlavor.html)

### Terminology Mapping ###

[Access terminology mappings between C-CDA and FHIR](conceptMaps.html)  
