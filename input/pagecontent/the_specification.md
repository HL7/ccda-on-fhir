[Previous Page - Background](background.html)

### FHIR Documents

C-CDA on FHIR relies on the FHIR Documents paradigm. Implementers need to be aware of and follow all the rules required for FHIR Documents. Please refer to that section of the core FHIR spec.

[http://hl7.org/fhir/documents.html](http://hl7.org/fhir/documents.html)

### Actors

The following actors are part of the US Core IG:

* Document Source: An application that exposes a clinical document to a consumer. This actor may also be the creator of the document, but could also me an intermediary. This can be thought of as the server in a client/server interaction. 
* Document Consumer: An application that consumes a clinical document. This can be thought of as the client in a client/server interaction. 

The C-CDA on FHIR specification does not define additional rules for sending/receiving documents beyond what is already defined in the FHIR core spec and US Core, though it is recommended that implementers consider using the US Core DocumentReference profile as a way to index any kind of document, including those compliant with C-CDA on FHIR. 

### Profiles and Extensions

To claim conformance to a C-CDA on FHIR Profile, servers SHALL:

* Be able to populate all profile data elements that have a minimum cardinality >= 1 and/or flagged as Must Support as defined by that profile’s StructureDefinition.
* Conform to the C-CDA on FHIR Server Capability Statement expectations for that profile’s type. 

The following profiles and extensions are present in the specification. Details on these profiles and extensions are available on the [Artifact Index page](artifacts.html). 

#### Composition Resource Profiles


* [US Realm Header](StructureDefinition-US-Realm-Header.html)
* [Procedure Note](StructureDefinition-Procedure-Note.html)
* [Care Plan Document](StructureDefinition-Care-Plan-Document.html)
* [Consultation Note](StructureDefinition-Consultation-Note.html)
* [Continuity of Care Document](StructureDefinition-Continuity-of-Care-Document.html)
* [Diagnostic Imaging Report](StructureDefinition-Diagnostic-Imaging-Report.html)
* [Discharge Summary](StructureDefinition-Discharge-Summary.html)
* [History and Physical](StructureDefinition-History-and-Physical.html)
* [Operative Note](StructureDefinition-Operative-Note.html)
* [Progress Note](StructureDefinition-Progress-Note.html)
* [Referral Note](StructureDefinition-Referral-Note.html)
* [Transfer Summary](StructureDefinition-Transfer-Summary.html)

Note: the C-CDA Unstructured Document profile is not included in this specification since it's use case is covered by the [US Core DocumentReference profile](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-documentreference.html). 

#### Extensions

* [Authorization Extension](StructureDefinition-AuthorizationExtension.html)
* [Informant Extension](StructureDefinition-InformantExtension.html)
* [Participant Extension](StructureDefinition-ParticipantExtension.html)
* [Performer Extension](StructureDefinition-PerformerExtension.html)
* [Data Enterer Extension](StructureDefinition-DataEntererExtension.html)
* [Information Recipient Extension](StructureDefinition-InformationRecipientExtension.html)
* [Order Extension](StructureDefinition-OrderExtension.html)
* [Version Number Extension](StructureDefinition-VersionNumber.html)

### Document Bundles

Per the FHIR Document's paradigm, the Composition resource and all references resources must be packaged in a FHIR Bundle resource where Bundle.type = document in order for the content in the Composition resource to be considered a "document". Un-bundled Composition resources are useful while a document is being edited, but until it has been bundled it does not meet the key characteristics of a clinical document (persistence, potential for authentication, etc.). The FHIR specification includes a $document operation on the Composition resource, and FHIR servers that support that operation can handle the task of bundling Composition and other resources. 

See the documentation on the [FHIR Bundle resource](http://hl7.org/fhir/bundle.html) and the [FHIR $document operation](http://hl7.org/fhir/composition-operation-document.html) for more information. 

### General Guidance

This section outlines important definitions, interpretations, and requirements common to all C-CDA on FHIR actors used in this guide. The conformance verbs - SHALL, SHOULD, MAY - used in this guide are defined in FHIR Conformance Rules.


#### US Core and C-CDA on FHIR

The C-CDA on FHIR specification relies on the US Core specification for all Composition.section.entry content. If a US Core profile does not exist for the expected content of a given section, then unprofiled resources are referenced instead. This was an intentional choice, representing a separation of concerns between the document-level profiles on the Composition resource (C-CDA on FHIR scope) and definition of discrete data needed for the exchange of coded information (US Core scope). It is expected that US Core will evolve over time, and as it does the C-CDA on FHIR specification will be updated to include new US Core Profiles. 

More information on US Core can be found [here](https://www.hl7.org/fhir/us/core/). 

#### Must Support

For querying and reading C-CDA on FHIR Profiles, Must Support on any profile data element SHALL be interpreted as follows:

* Document Sources SHALL be capable of populating all data elements as part of the query results as specified by the C-CDA on FHIR Server Capability Statement.
* Document Consumers SHALL be capable of processing resource instances containing the data elements without generating an error or causing the application to fail. In other words Document Consumers SHOULD be capable of displaying the data elements for human use or storing it for other purposes.
* In situations where information on a particular data element is not present and the reason for absence is unknown, Document Sources SHALL NOT include the data elements in the resource instance returned as part of the query results.
* When querying Document Sources, Document Consumers SHALL interpret missing data elements within resource instances as data not present in theDocument Sources’s system.
* In situations where information on a particular data element is missing and the Document Source knows the precise reason for the absence of data, Document Sources SHALL send the reason for the missing information using values (such as nullFlavors) from the value set where they exist or using the dataAbsentReason extension.
* Document Consumers SHALL be able to process resource instances containing data elements asserting missing information.

#### Implementation Notes when Moving from C-CDA to C-CDA on FHIR

Implementers moving from C-CDA to FHIR need to be aware that the goal of this project is to address the same use case as Consolidated CDA (clinical documentation for primary and transfer of care scenarios in the US), but the syntax, methodologies, and value sets in FHIR are often quite different from those in C-CDA. In particular, implementers need to be aware of the issues listed below:

* The value sets used in US Core and FHIR in general are not fully aligned with those in C-CDA.
* The approaches for negation used in C-CDA and the Core FHIR specification are quite different.
* The level of granularity between C-CDA templates and FHIR resources/profiles is often different, so there will not be a 1:1 mapping between templates and profiles. Some examples include:
* Multiple templates like Health Concern and Problem Observation map to a single US Core Condition
* C-CDA has 3 kinds of procedure templates that all map to the single US Core Procedure profile
* In C-CDA the use the moodCode attribute can differentiate between events and planned acts using a single template but in FHIR these are often separate resources (event vs. request resources)
* In C-CDA multiple observations such as lab results are wrapped in an Organizer, whereas in FHIR the Observation resource itself can contain multiple Observations as subcomponents
* Implementers need to follow the rules and apply the value sets used by the target specification, and this will often require significant data and vocabulary mapping. implementers moving from C-CDA to C-CDA on FHIR will need to review the US Core profiles and value sets in core FHIR resources and ensure that their instances FHIR instances are compliant. We hope that ongoing work in HL7 will better align US Core, C-CDA, and the Core FHIR specifications in the future.

#### Mapping between C-CDA and C-CDA on FHIR
We encourage implementers to refer to the ongoing C-CDA to FHIR mapping work that is described on the [Model Based Transformation Service](https://confluence.hl7.org/display/SOA/Model-Based+Transformation+Service) project page.

[Next Page - Downloads](downloads.html)