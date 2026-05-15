Instance: CcdaOnFhirServer
InstanceOf: CapabilityStatement
Usage: #definition
* meta
  * versionId = "12"
  * lastUpdated = "2020-08-13T15:57:20.047+00:00"
  * source = "#CXWcf7GLdy7BZgYk"
* url = "http://hl7.org/fhir/us/ccda/CapabilityStatement/CcdaOnFhirServer"
* version = "1.0"
* name = "CcdaOnFhirServer"
* title = "CCDA on FHIR Server"
* status = #active
* experimental = false
* date = "2020-08-12"
* publisher = "HL7 International - Structured Documents Working Group"
* description = "This section describes the expected capabilities of the C-CDA on FHIR Document Source (aka server) actor which is responsible for responding to the queries for clinical documents provided by a C-CDA on FHIR Document Consumer (aka client) actor. This CapabilityStatement imports and extends the [us-core-server CapabilityStatement](https://www.hl7.org/fhir/us/core/CapabilityStatement-us-core-server.html)"
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server"
* fhirVersion = #4.0.1
* format[0] = #xml
* format[+] = #json
* rest
  * mode = #server
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