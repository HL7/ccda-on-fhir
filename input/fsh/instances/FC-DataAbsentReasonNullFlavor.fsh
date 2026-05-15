Instance: FC-DataAbsentReasonNullFlavor
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/FC-DataAbsentReasonNullFlavor"
* version = "4.0.1"
* name = "FHIRtoCCDADataAbsentReasonNullFlavor"
* title = "FHIR Data Absent Reason to C-CDA NullFlavor"
* status = #active
* experimental = false
* publisher = "HL7 International"
* contact
  * name = "HL7 International"
  * telecom[0]
    * system = #phone
    * value = "+1 734 677 7777"
  * telecom[+]
    * system = #fax
    * value = "+1 734 677 6622"
  * telecom[+]
    * system = #email
    * value = "info@hl7.org"
* description = "FHIR Data Absent Reason to C-CDA NullFlavor. Adapted from https://hl7.org/fhir/R4/cm-data-absent-reason-v3.html but several key changes have been made. Note that this prior concept map (from R4) is no longer included in current FHIR build."
* sourceUri = "http://hl7.org/fhir/ValueSet/data-absent-reason"
* targetUri = "http://terminology.hl7.org/ValueSet/v3-NullFlavor"
* group
  * source = "http://terminology.hl7.org/CodeSystem/data-absent-reason|1.0.0"
  * target = "http://terminology.hl7.org/CodeSystem/v3-NullFlavor|4.0.0"
  * element[0]
    * code = #unknown
    * display = "Unknown"
    * target
      * code = #NI
      * display = "NoInformation"
      * equivalence = #wider
      * comment = "In CDA, 'UNK' means 'a proper value is applicable, but not known.' Guidance has been to use this when the value is known to exist and to use the broader 'NI' when no specific information about why the value is unknown. FHIR's data absent reason of 'unknown' better maps to 'NI'."
  * element[+]
    * code = #asked-unknown
    * display = "Asked But Unknown"
    * target
      * code = #ASKU
      * display = "asked but unknown"
      * equivalence = #equivalent
  * element[+]
    * code = #temp-unknown
    * display = "Temporarily Unknown"
    * target
      * code = #NAV
      * display = "temporarily unavailable"
      * equivalence = #equivalent
  * element[+]
    * code = #not-asked
    * display = "Not Asked"
    * target
      * code = #NASK
      * display = "not asked"
      * equivalence = #equivalent
  * element[+]
    * code = #asked-declined
    * display = "Asked But Declined"
    * target
      * code = #UNK
      * display = "unknown"
      * equivalence = #wider
  * element[+]
    * code = #masked
    * display = "Masked"
    * target
      * code = #MSK
      * display = "masked"
      * equivalence = #equivalent
  * element[+]
    * code = #not-applicable
    * display = "Not Applicable"
    * target
      * code = #NA
      * display = "not applicable"
      * equivalence = #equivalent
  * element[+]
    * code = #unsupported
    * display = "Unsupported"
    * target
      * code = #NI
      * display = "NoInformation"
      * equivalence = #wider
  * element[+]
    * code = #as-text
    * display = "As Text"
    * target
      * code = #OTH
      * display = "other"
      * equivalence = #wider
  * element[+]
    * code = #error
    * display = "Error"
    * target
      * code = #NAV
      * display = "temporarily unavailable"
      * equivalence = #wider
  * element[+]
    * code = #not-a-number
    * display = "Not a Number (NaN)"
    * target
      * code = #OTH
      * display = "other"
      * equivalence = #wider
  * element[+]
    * code = #negative-infinity
    * display = "Negative Infinity (NINF)"
    * target
      * code = #NINF
      * display = "negative infinity"
      * equivalence = #equivalent
  * element[+]
    * code = #positive-infinity
    * display = "Positive Infinity (PINF)"
    * target
      * code = #PINF
      * display = "positive infinity"
      * equivalence = #equivalent
  * element[+]
    * code = #not-performed
    * display = "Not Performed"
    * target
      * code = #NASK
      * display = "not asked"
      * equivalence = #wider
  * element[+]
    * code = #not-permitted
    * display = "Not Permitted"
    * target
      * code = #OTH
      * display = "other"
      * equivalence = #wider