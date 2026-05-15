Instance: CcdaOnFhirClient
InstanceOf: CapabilityStatement
Usage: #definition
* meta
  * versionId = "4"
  * lastUpdated = "2020-08-13T15:32:45.138+00:00"
  * source = "#vsazekVhbJUN5DVP"
* url = "http://hl7.org/fhir/us/ccda/CapabilityStatement/CcdaOnFhirClient"
* version = "1.0"
* name = "CcdaOnFhirClient"
* title = "CCDA on FHIR Client"
* status = #active
* experimental = false
* date = "2020-08-12"
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
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * interaction[+].code = #vread
    * interaction[+].code = #update
    * interaction[+].code = #patch
    * interaction[+].code = #delete
    * interaction[+].code = #history-instance
    * interaction[+].code = #history-type
  * resource[+]
    * type = #Composition
    * supportedProfile[0] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Care-Plan-Document"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Consultation-Note"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Continuity-of-Care-Document"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Diagnostic-Imaging-Report"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Discharge-Summary"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Operative-Note"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Procedure-Note"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Progress-Note"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Referral-Note"
    * supportedProfile[+] = "http://hl7.org/fhir/us/ccda/StructureDefinition/Transfer-Summary"
    * interaction[0].code = #create
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * interaction[+].code = #vread
    * interaction[+].code = #update
    * interaction[+].code = #patch
    * interaction[+].code = #delete
    * interaction[+].code = #history-instance
    * interaction[+].code = #history-type