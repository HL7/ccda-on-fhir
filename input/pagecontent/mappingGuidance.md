<style>
td, th {
   border: 1px solid black!important;
}
</style>

### Reading the C-CDA ↔ FHIR Mapping Tables 

#### How to Read Mapping Tables and Transform Steps? 

When specific steps are included for mapping content between C-CDA and FHIR, those steps will be listed in the "Transform Steps" column in the following order: 

1. **Constraint (labeled in bold)**: Only perform the action when this constraint is fulfilled
2. **Structural Guidance (Bidirectional guidance shown as ↔)**: Generalized narrative guidance on structural transform between CDA and FHIR elements. This links to section on this current page
3. **ConceptMap (Terminology mapping direction shown as →)**: Link to a computable map between CDA and FHIR vocabularies. This links to conceptMaps listed on this [page](conceptMaps.html)
4. **Notes (no label)**: Other notes specific to this element mapping

#### What Examples are Included?

Examples for C-CDA to FHIR transforms are provided based on a consensus of various vendors performing mappings. All vendors received the sample input (e.g. C-CDA Document) and generated output (e.g. FHIR Resource) which were then iterated through group discussion to a consensus. 

The highlighted output images were created using an open source tool for C-CDA ↔ FHIR Mapping developed as part of this project.  

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
|No URL exists|use OID|2.16.840.1.113883.4.500|1234567890V123456|urn:oid:2.16.840.1.113883.4.500|1234567890V123456
|One-value pattern|use OID specification URI for system|2.16.840.1.113883.4.500.123456789||urn:ietf:rfc:3986|urn:oid:2.16.840.1.113883.4.500.123456789

##### FHIR Identifier → CDA id with Example Mapping

|Case|Approach|identifier.system|identifier.value|CDA id@root|CDA id@extension|
|:--|:--|:--|:--|:--|:--|
|OID exists|translate|http://hl7.org/fhir/sid/us-ssn|123-45-6789|	2.16.840.1.113883.4.1|123-45-6789
|No OID exists|concatenate; use URL specification URI for root|http://www.myOrg.com/patients|123456789|2.16.840.1.113883.4.873 <br/> (OID for urn:ietf:rfc:3986)|http://www.myOrg.com/patients/123456789
|No OID exists|invent|urn:myNID:myOrganization|123456789|f9a48f2a-0f86-11ed-861d-0242ac120002|urn:myNID:myOrganization:123456789
|One-value pattern|introspect steward organization OID||123456789|2.16.840.1.113883.4.349|123456789

#### FHIR IDs

FHIR ids are strings: they have no system. We propose not preserving them. They could be used in II.extension but we have no way to identify a root. If someone can ascertain a reliable, repeatable way to do that, we might be able to keep the id.

In some cases, a CDA template requires an id, and the source FHIR resource may not have an identifier. In these cases, use of nullFlavor or UUID generation approach may be reasonable options.

#### CDA ↔ FHIR Time/Dates

CDA date-time values are based on a pattern of YYYYMMDDHHmmss+zzzz and [FHIR date-time values](https://hl7.org/fhir/datatypes.html#dateTime) are based on a YYYY-MM-DDThh:mm:ss+zz:zz. Partial expressions (e.g. 202305 for CDA or 2023-05 for FHIR) are allowed in both standards. 

To convert between the standards, systems should deploy programming logic that converts formats and preserves the level of precision. For example, "20230531" from CDA would become "2023-05-31" in FHIR (not 2023-05-31T00:00:00+00:00). Additional examples below: 

|CDA Date Time|FHIR Date Time|
|:-----|:-----|:-------------|
|2023|2023|
|202305|2023-05|
|20230531|2023-05-31|
|202305312205-0500|2023-05-31T22:05-05:00|

#### CDA Coding ↔ FHIR CodeableConcept

The structure for coding in CDA and FHIR are fundamentally different. CDA  employs a mechanism (xsi:type [CD](http://hl7.org/cda/stds/core/draft1/StructureDefinition-CD.html) or [CE](http://hl7.org/cda/stds/core/draft1/StructureDefinition-CE.html)) where the code is included in the element and then originalText and translations elements may be provided and children elements. In FHIR, [CodeableConcept](http://hl7.org/fhir/datatypes.html#codeableconcept) places all codes in a coding list with a separate element for the text representation. 

##### CDA Coding → FHIR CodeableConcept

|CDA Property|FHIR Target|Notes|
|:-----|:-----|:-------------|
|@code|coding.code||
|@codeSystem|coding.system|Requires mapping OID → URL or adding `urn:oid:` prefix|
|@displayName|coding.display|
|originalText|text|CDA references must be resolved since [text](http://hl7.org/fhir/datatypes-definitions.html#CodeableConcept.text) is a string in FHIR|
|translation@code|coding.code||
|translation@codeSystem|coding.system|Requires mapping OID → URL or adding `urn:oid:` prefix|
|translation@displayName|coding.display|

##### FHIR CodeableConcept → CDA Coding

|FHIR Property|CDA Target|Notes|
|:-----|:-----|:-------------|
|coding.code|@code<br/>or<br/>translation@code|The criteria for mapping to @code varies by valueset binding within CDA templates. When no coding.code matches the target valueset, the @code should be omitted and @nullFlavor="OTH" used placing all coding as translation elements|
|coding.display|coding.displayName<br/>or<br/>translation@displayName|
|coding.system|@codeSystem<br/>or<br/>translation@codeSystem|Requires URL → OID mapping or removal or `urn:oid:` prefix|
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

CDA has one mechanism for references; FHIR has two: the [narrativeLink extension](http://hl7.org/fhir/StructureDefinition/narrativeLink) and the [originalText extension](http://hl7.org/fhir/StructureDefinition/originalText). Since CDA does not distinguish between the "original" and "representation" cases, we use the more general "representation" (narrativeLink) extension for these maps. Note also that the CDA use of reference points to generated text, which may not fit the definition of "original."

CDA referenced typically point to section/text which may include embedded lists or tables. Issues with text reference technical capabilities are not addressed here (e.g., referencing a table row without an agreed convention for identifying table header data).

Implementers transforming a CDA document may wish to dereference the text and provide it in the target FHIR resource as text. This is appropriate, but we do not provide instructions for doing so. Implementers may also provide referenced text along with the reference. 

#### CDA ↔ FHIR Provenance

CDA provides a repeated set of elements within each activity for information on data provenance: 

- **author**: Represents the humans and/or machines that authored the [document/section/entry/act]. 
- **performer**: A person who actually and principally carries out an action.
- **informant**: An informant (or source of information) is a person that provides relevant information, such as the parent of a comatose patient who describes the patient's behavior prior to the onset of coma.
- **participant** Used to represent other participants not explicitly mentioned by other classes, that were somehow involved in the documented activities

FHIR, however, provides different elements within different resources that convey some information on provenance and a dedicated [Provenance resource](http://hl7.org/fhir/R4/provenance.html) which references a  target resource. In addition, FHIR documents do not provide context conduction, so all FHIR resources in a FHIR document should have explicit Provenance. 

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<blockquote class="stu-note">
		<b>Provenance Mapping</b>
		<p>This publication does <b>not</b> provide definitive CDA → FHIR guidance on when resource attributes (e.g. AllergyIntolerance.recorder) vs. dedicated Provenance resources (e.g. Provenance targeting an AllergyIntolerance resource) should be used for documenting data provenance. We welcome feedback on this topic from implementers.</p>
	</blockquote>
</div>

At a minimum, it is recommended that when [US CORE Provenance](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-provenance.html) resources are present in a FHIR document, that they should be mapped to provenance as defined in the [C-CDA Companion Guide](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=447). 

#### Name, Address, Telecom ####

The mappings of name, address and telecom information is useful in many part of C-CDA ↔ FHIR mapping. These are a combination of string, code and date mappings as shown below and may be re-used across many templates/resources.   

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
|.use|@use|[Name use (FHIR) → Name use (CDA)]((./ConceptMap-FC-NameUse.html))|
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

The use of nullFlavor in CDA is explained in depth in Volume 1 of the [C-CDA Implementation Guide](http://hl7.org/cda/stds/ccda/draft1/designconsiderations.html#unknown-and-no-known-information) and in the [C-CDA Companion Guide](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=447). 

The use of the data absent reason extension is explained in depth in the [US CORE Implementation Guide](https://build.fhir.org/ig/HL7/US-Core/general-requirements.html#missing-data) and also in the [base extension](http://hl7.org/fhir/extension-data-absent-reason.html).

In this publication, we include a mapping between missing data concepts. **Importantly, it should be noted that several mappings include non-equivalence (wider or narrower or unsupported)**. Additional implementer guidance is welcome on the handling of missing data between C-CDA and FHIR:
- [NullFlavor (CDA) → Data Absent Reason code (FHIR)](./ConceptMap-CF-NullFlavorDataAbsentReason.html) 
- [Data Absent Reason code (FHIR) → NullFlavor (CDA)](./ConceptMap-FC-NullFlavorDataAbsentReason.html)

### Terminology Mapping ###

[Access terminology mappings between C-CDA and FHIR](conceptMaps.html)  
