[Previous Page - Home Page](index.html)

### Clinical Documents

Clinical documents come in many forms, from paper documents in a filing cabinet to electronic documents shared via Health Information Exchanges (HIEs). Regardless of their form, clinical documents share key characteristics that differentiate them from messages or queries for discrete data elements. 

#### Key Characteristics of Clinical Documents

* Persistence – A clinical document continues to exist in an unaltered state, for a time period defined by local and regulatory requirements. Note: documents outlive the servers (and often the syntax) on which they are created. 
* Stewardship – A clinical document is maintained by an organization entrusted with its care. 
* Potential for authentication – A clinical document is an assemblage of information that is intended to be legally authenticated. 
* Context – A clinical document establishes the default context for its contents. 
* Wholeness – Authentication of a clinical document applies to the whole and does not apply to portions of the document without the full context of the document. 
* Human readability – A clinical document is human readable. 

### Clinical Document Architecture

The HL7 Version 3 Clinical Document Architecture (CDA®) is a document markup standard that specifies the structure and semantics of "clinical documents" for the purpose of exchange between healthcare providers and patients. It defines a clinical document as having the following six characteristics: 1) Persistence, 2) Stewardship, 3) Potential for authentication, 4) Context, 5) Wholeness and 6) Human readability.

A CDA can contain any type of clinical content -- typical CDA documents would be a Discharge Summary, Imaging Report, Admission & Physical, Pathology Report and more. The most popular use is for inter-enterprise information exchange, such as is envisioned for a US Health Information Exchange (HIE).

More information on CDA can be found [here](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=7). 

### Consolidated CDA (C-CDA)

The Consolidated CDA (C-CDA) implementation guide contains a library of CDA templates, incorporating and harmonizing previous efforts from Health Level Seven (HL7), Integrating the Healthcare Enterprise (IHE), and Health Information Technology Standards Panel (HITSP). It represents harmonization of the HL7 Health Story guides, HITSP C32, related components of IHE Patient Care Coordination (IHE PCC), and Continuity of Care (CCD). C-CDA Release 1 included all required CDA templates in Final Rules for Stage 1 Meaningful Use and 45 CFR Part 170 – Health Information Technology: Initial Set of Standards, Implementation Specifications, and Certification Criteria for Electronic Health Record Technology; Final Rule. This R2.1 guide was developed and produced by the HL7 Structured Documents Workgroup. It updates the C-CDA R2 (2014) guide to support “on-the-wire” compatibility with R1.1 systems C-CDA Release 2.1 implementation guide, in conjunction with the HL7 CDA Release 2 (CDA R2) standard, is to be used for implementing the following CDA documents and header constraints for clinical notes: Care Plan including Home Health Plan of Care (HHPoC), Consultation Note, Continuity of Care Document (CCD), Diagnostic Imaging Reports (DIR), Discharge Summary, History and Physical (H&P), Operative Note, Procedure Note, Progress Note, Referral Note, Transfer Summary, Unstructured Document, Patient Generated Document (US Realm Header).

More information on C-CDA can be found [here](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=492). 

### Moving from CDA/C-CDA to FHIR

Since C-CDA exists and has seen widespread implementation, one may question why a FHIR version is desired. The main reason is that CDA and C-CDA are based on HL7 Version 3, which while XML-based was (and still is) rather difficult to implement for a variety of reasons such as data types that are not widely implemented in software libraries, reliance on xsi:type for datatype choices, etc. Also, FHIR is much easier to learn than CDA, so while implementers who are already familiar with CDA will likely keep working with it, new implementers are likely to want to more directly to FHIR. 

#### CDA Header to FHIR Composition Resource Analysis

Efforts to map from CDA to FHIR began shortly after FHIR DSTU 1 (aka FHIR R1) was published. The initial work compared the CDA header to the FHIR Composition resource to identify any discrepancies. This work resulted in some key changes to the Composition resource in FHIR DSTU 2 (aka FHIR R2). This initial mapping work is still available via a Google Docs Spreadsheet located [here](https://docs.google.com/spreadsheets/d/1KctdexG3oB2QBiBQNH1Rbt2uJ6DxQFROyIFKo5q95WU/edit#gid=1223244219). 

#### Argonaut Project C-CDA Templates to FHIR Resource Mappings

The Argonaut Project is a private sector initiative to advance industry adoption of modern, open interoperability standards. More information on Argonaut can be found [here](https://argonautwiki.hl7.org/Main_Page). 

One of the earliest efforts of the Argonaut Project was a comparison of C-CDA templates to available FHIR resources, with the goal of determining if FHIR could handle the C-CDA use case, and if not make the necessary changes to FHIR so that it could. This work was done in advance of FHIR DSTU 2, and resulted in a number of changes before the publication of that version of FHIR. The work was done via Google Docs Spreadsheets that compared C-CDA templates section by section to the corresponding FHIR resources. The mapping work is still available [here](https://drive.google.com/drive/u/1/folders/0B44mVoChqHDtaEl4ZGtvclhtRGs). 

### The C-CDA on FHIR Project

The C-CDA on FHIR Project is a volunteer effort that picked up where the Argonaut analytical mappings left off. The initial goal of the project was to represent Consolidated CDA Templates for Clinical Notes (C-CDA) 2.1 templates using FHIR profiles. The first stage of the project defined C-CDA document-level profiles on the Composition resource and contained sections. All coded data used by sections was accomplished by referencing relevant US-Core FHIR profiles. This work was completed and the IG was published in April 2018. 

The current work represented in this implementation guide has proceeded as an unballoted STU update to upgrade the FHIR STU 3 profiles to FHIR R4 and make any other necessary changes to comply with the latest FHIR quality criteria.

[Next Page - The Specification](the_specification.html)