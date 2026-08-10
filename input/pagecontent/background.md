[Consolidated Clinical Document Architecture (C-CDA)](https://hl7.org/cda/us/ccda/) and [Fast Healthcare Interoperability Resources (FHIR) US Core](http://hl7.org/fhir/us/core/STU6.1/) are two of the most common standards for exchanging clinical data in the United States. But things are changing:

* As FHIR adoption grows, we need an agreed way to construct FHIR documents.
* As CMS and ONC guidance change, we face a situation where there is a great deal of existing information and capability in CDA, and a great need to consume that information with APIs. 
* There are also use cases for moving information from FHIR to CDA, primarily in the public health domain.

This IG combines two related workstreams. The first is a specification for FHIR profiles to support transmission of a FHIR document bundle containing data conforming to the C-CDA information model. This effort is supported by the document profiles, which conform to the UV FHIR Clinical Document specification. The second is guidance on translating between XML C-CDA documents and FHIR documents. The two efforts share a common set of examples.

Note that C-CDA is a very large specification, so this guidance does not attempt to address every template. Instead, it focuses on the data elements specified in USCDI. This version supports USCDI-3, which is supported by FHIR US Core R6.1 and C-CDA 2.1 & Companion Guide 4.1. The 2.1 publication does not provide a USCDI index, so we use the index to USCDI-4 provided in C-CDA 3.0. We expect to advance these maps to keep up with USCDI in the future.

In addition to these (primarily) entry level USCDI elements, both the profiles and the maps also address the document headers.

FHIR-to-C-CDA element and terminology maps are notated "FHIR->C-CDA"; C-CDA-to-FHIR as  "C-CDA->FHIR". 

By establishing the HL7 mapping transformation guidance, the project provides clarity and consistency in translating data between C-CDA and FHIR, as well as simply providing an agreed common understanding of their meaning. This clarity and consistency are critical to ensure interoperability and communication across different healthcare systems, devices, applications and to ensure accurate public reporting and analytics. Ultimately, consistent transforms between standards reduces duplication of patient data and leads to better patient care and improved healthcare outcomes. In addition, this work clearly identifies elements where divergent assumptions impede reliably correct and unambiguous translation. These elements may present opportunities for refining the standards.

### Transformation Challenges and Limitations 

Some implementers may be interested in extracting FHIR resources from CDA documents without actually creating a document. This should not present any problems, as long as the implementer correctly reproduces the resource context. Entries in CDA documents inherit context from their sections and documents, as explained [here](https://build.fhir.org/ig/HL7/CDA-ccda/generalguidance.html#context-conduction), but FHIR resources are independent: they must explicitly assert context in order for it to propagate.

There has been more interest in mapping from C-CDA to FHIR: there are more of these maps, and they are more mature, having been tested by multiple implementer stakeholders. The FHIR-to-C-CDA direction covers the PAMPI domains (Problem, Allergy, Medication, Procedure, Immunization), but with less maturity.

Since the information models were built by different people at different times, the underlying assumptions differ. As a result, there are cases where the mapping is less precise than the underlying data might support, and where as a result a "round trip" from one specification to the other and back will result in a loss of information. In some cases, the loss can be identified prospectively, in which case we annotate the maps, but there may be cases where this is not true.

### Approach

This guide builds on prior work: analysis comparing the CDA header to the FHIR Composition resource began shortly after FHIR DSTU 1 and drove changes to Composition itself, and the resulting document profiles were first published on FHIR STU 3 in April 2018. The current effort upgrades those profiles to FHIR R4 and joins them with the mapping guidance developed since.

We employed several tactics to meet our goals. Standards developers drafted maps based on the respective specifications, and these were reviewed by stakeholders both offline and at public, regularly scheduled meetings. These meetings included implementers, terminologists, regulatory and public health representatives, and strategists, who engaged in realignment, consensus-seeking, and reformatting of the maps for a variety of audiences. Difficult questions were escalated to the work groups responsible for the specifications. Issues and their resolutions were logged in the publicly accessible [project site](https://confluence.hl7.org/spaces/CGP/pages/111124183/C-CDA+to+FHIR+and+from+US+Core+Mapping).

In addition, the project team employed the example-based approach through Connectathons with vendors and experts in the standards community. The approach involves sharing inbound examples among the vendors, comparing the outbound artifacts generated by these vendors, and discussing with the group to achieve alignment in best practice recommendations. Our team has been focused on the generated artifacts, regardless of the transformation technologies, so any vendor is empowered to achieve the same transformation results. Note that, to date, the Connectathons have addressed only the CDA-to-FHIR cases, though two implementers have provided feedback on the FHIR-to-CDA cases.

### Relationships to FHIR Clinical Documents, the International Patient Summary (IPS), and the US Patient Care Summary (PCS)

The FHIR profiles in this guide are derived from the [FHIR Clinical Documents](https://hl7.org/fhir/uv/fhir-clinical-document/STU1.1/en/) specification. This is the same foundation used by the [PCS](https://build.fhir.org/ig/HL7/us-fhir-ps/en/index.html).

The content scope of this guide is USCDI-3, plus header and provenance.

The structural scope of the maps is the two US specifications supporting that content scope: C-CDA and FHIR US Core. The maps do not change specifications: a CDA document with a CCD code will result in a FHIR document with a CCD code; it will never change into a PCS.

As the PCS was built with one eye on C-CDA, the guidance aligns closely with that in US PCS. Entry maps will be valid irrespective of the containing template.

We note the following differences:

- C-CDA permits negation in medication activities; IPS does not. PCS restores it (but recommends exclusion). US Core only supports 'do-not-give' requests: 'not-taking' and 'not-done' are proper to resources not supported by US Core.
