### Reading the C-CDA ↔ FHIR Mapping Pages 

#### How to Read Mapping Tables and Transform Steps? 

When specific steps are included for mapping content between C-CDA and FHIR, those steps will be listed in the "Transform Steps" column in the following order: 

1. **Constraint (labeled in bold)**: Only perform the action when this constraint is fulfilled
2. **Structural Guidance (Bidirectional guidance shown as ↔)**: Generalized narrative guidance on structural transform between CDA and FHIR elements. This links to section on this current page
3. **ConceptMap (Terminology mapping direction shown as →)**: Link to a computable map between CDA and FHIR vocabularies. This links to conceptMaps listed on this [page](conceptMaps.html)
4. **Notes (no label)**: Other notes specific to this element mapping

#### What Examples are Included?

Examples for C-CDA to FHIR transforms are provided based on a consensus of various vendors performing mappings. All vendors received the sample input (i.e. C-CDA Document) and the consensus output (i.e. FHIR Resource). 

The highlighted outputs were created using an open source tool for C-CDA ↔ FHIR Mapping developed as part of this project.  

### Guidance

#### CDA id ↔ FHIR identifier

Identifiers in both FHIR and CDA can divide the identifier value from its namespace: FHIR as the identifier.system and CDA as the id.root. In many cases, this correspondence works well.

However, the FHIR system can be any URI, including OIDs & UUIDs as well as URLs. CDA roots must be UIDs, which consist of OIDs and UUIDs only. CDA roots can often be used as FHIR systems, but FHIR systems must often be translated. In some cases, the URL has a registered equivalent OID, for example, an identifier with a FHIR system of http://hl7.org/fhir/sid/us-ssn can be represented with a CDA root of 2.16.840.1.113883.4.1.

If there is no such OID, and if the FHIR identifier is a URL, we can use the URL specification itself as the system, and that specification - urn:ietf:rfc:3986 - has a registered OID equivalent, 2.16.840.1.113883.4.873. The FHIR identifier.value can be appended to the system for the CDA extension. These ids can be represented as below.

Cases where the FHIR system uses a scheme with no OID present a problem. The UID type is primitive, represented only as an XML attribute, and it cannot have a null flavor. One solution may be to generate a UUID, but expectations around the UUID's persistence and recognizability may vary.

##### CDA → FHIR Identifier

|Case|Approach|CDA id@root|CDA id@extension|identifier.system|identifier.value|
|:--|:--|:--|:--|:--|:--|
|URL exists|translate|2.16.840.1.113883.4.1|123-45-6789|http://hl7.org/fhir/sid/us-ssn|123-45-6789
|No URL exists|use OID|2.16.840.1.113883.4.500|1234567890V123456|urn:oid:2.16.840.1.113883.4.500|1234567890V123456
|One-value pattern|use OID specification URI for system|2.16.840.1.113883.4.500.123456789||urn:ietf:rfc:3986|urn:oid:2.16.840.1.113883.4.500.123456789

##### FHIR → CDA Identifier Example Mapping

|Case|Approach|identifier.system|identifier.value|CDA id@root|CDA id@extension|
|:--|:--|:--|:--|:--|:--|
|OID exists|translate|http://hl7.org/fhir/sid/us-ssn|123-45-6789|	2.16.840.1.113883.4.1|123-45-6789
|No OID exists|concatenate; use URL specification URI for root|http://www.myOrg.com/patients|123456789|2.16.840.1.113883.4.873 <br/> (OID for urn:ietf:rfc:3986)|http://www.myOrg.com/patients/123456789
|No OID exists|invent|urn:myNID:myOrganization|123456789|f9a48f2a-0f86-11ed-861d-0242ac120002|urn:myNID:myOrganization:123456789
|One-value pattern|introspect steward organization OID||123456789|2.16.840.1.113883.4.349|123456789

##### FHIR IDs ######

FHIR ids are strings: they have no system. We propose not preserving them. They could be used in II.extension but we have no way to identify a root. If someone can ascertain a reliable, repeatable way to do that, we might be able to keep the id.

In some cases, a CDA template requires an id, and the source FHIR resource may not have an identifier. In these cases, use of nullFlavor or UUID generation approach may be reasonable options.

#### CDA ↔ FHIR Time/Dates

Text about what to do

#### CDA xsi:type=CD ↔ FHIR CodeableConcept

Text about what to do

####  Guidance on CDA ↔ FHIR Provenance

Text about what to do
