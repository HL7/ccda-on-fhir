Instance: CcdaOnFhirClient
InstanceOf: CapabilityStatement
Usage: #definition
* meta
  * versionId = "4"
  * lastUpdated = "2020-08-13T15:32:45.138+00:00"
  * source = "#vsazekVhbJUN5DVP"
* url = "http://hl7.org/fhir/us/ccda/CapabilityStatement/CcdaOnFhirClient"
* version = "2.0.0"
* name = "CcdaOnFhirClient"
* title = "CCDA on FHIR Client"
* status = #active
* experimental = false
* date = "2026-07-18"
* publisher = "HL7 International - Structured Documents Working Group"
* description = "This section describes the expected capabilities of the C-CDA on FHIR Document Consumer (aka client) actor which is responsible for creating and initiating the queries for clinical documents provided by a C-CDA on FHIR Document Source (aka server) actors. This CapabilityStatement imports and extends the [us-core-client CapabilityStatement](https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-client.html)"
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-client"
* fhirVersion = #4.0.1
* format[0] = #xml
* format[+] = #json
* rest
  * mode = #client
  * resource[0]
    * type = #Bundle
    * interaction[0].code = #create
    * interaction[+].code = #read
    * interaction[+].code = #vread
    * interaction[+].code = #search-type
    * interaction[+].code = #update
    * interaction[+].code = #delete
    * operation[0]
      * name = "validate"
      * definition = "http://hl7.org/fhir/OperationDefinition/Resource-validate"
      * documentation = "Pre-flight check: a document Bundle MAY be submitted for validation without being stored."
  * resource[+]
    * type = #Composition
    * supportedProfile[0] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Care-Plan-Document"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Consultation-Note"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Continuity-of-Care-Document"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Diagnostic-Imaging-Report"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Discharge-Summary"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/History-and-Physical"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Operative-Note"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Procedure-Note"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Progress-Note"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Referral-Note"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Transfer-Summary"
    * interaction[0].code = #read
    * interaction[+].code = #search-type
    * operation[0]
      * name = "document"
      * definition = "http://hl7.org/fhir/OperationDefinition/Composition-document"
      * documentation = "Generate a complete document Bundle on demand from a stored Composition."
  * resource[+]
    * type = #DocumentReference
    * supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference"
    * documentation = "Document discovery/indexing (see Document Guidance page)."
    * interaction[0].code = #read
    * interaction[+].code = #search-type
* document[0]
  * mode = #producer
  * profile = "http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/clinical-document-bundle"
  * documentation = "Authors documents and submits them to servers (create/update/delete)."
* document[+]
  * mode = #consumer
  * profile = "http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/clinical-document-bundle"
  * documentation = "Requests, retrieves, and displays documents provided by servers."
