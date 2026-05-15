Instance: CF-NullFlavorDataAbsentReason
InstanceOf: ConceptMap
Usage: #definition
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
  * valueCode = #cgp
* url = "http://hl7.org/fhir/us/ccda/ConceptMap/CF-NullFlavorDataAbsentReason"
* version = "4.0.1"
* name = "CCDAtoFHIRNullFlavorDataAbsentReason"
* title = "C-CDA NullFlavor to FHIR Data Absent Reason"
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
* description = "C-CDA NullFlavor to FHIR Data Absent Reason. Adapted from https://hl7.org/fhir/R4/cm-data-absent-reason-v3.html but several key changes have been made. Note that this prior concept map (from R4) is no longer included in current FHIR build."
* sourceUri = "http://terminology.hl7.org/ValueSet/v3-NullFlavor"
* targetUri = "http://hl7.org/fhir/ValueSet/data-absent-reason"
* group
  * source = "http://terminology.hl7.org/CodeSystem/v3-NullFlavor|4.0.0"
  * target = "http://terminology.hl7.org/CodeSystem/data-absent-reason|1.0.0"
  * element[0]
    * code = #NI
    * display = "NoInformation"
    * target
      * code = #unknown
      * display = "Unknown"
      * equivalence = #inexact
      * comment = "When the item is not required, US CORE guidance is to omit the element and not include data-absent-reason. When the item is required, US CORE guidance is to use unknown as the broadest concept"
  * element[+]
    * code = #OTH
    * display = "other"
    * target
      * code = #unsupported
      * display = "Unsupported"
      * equivalence = #wider
  * element[+]
    * code = #NINF
    * display = "negative infinity"
    * target
      * code = #negative-infinity
      * display = "Negative Infinity (NINF)"
      * equivalence = #equivalent
  * element[+]
    * code = #PINF
    * display = "positive infinity"
    * target
      * code = #positive-infinity
      * display = "Positive Infinity (PINF)"
      * equivalence = #equivalent
  * element[+]
    * code = #MSK
    * display = "masked"
    * target
      * code = #masked
      * display = "Masked"
      * equivalence = #equivalent
  * element[+]
    * code = #NA
    * display = "not applicable"
    * target
      * code = #not-applicable
      * display = "Not Applicable"
      * equivalence = #equivalent
  * element[+]
    * code = #UNK
    * display = "unknown"
    * target
      * code = #unknown
      * display = "Unknown"
      * equivalence = #wider
  * element[+]
    * code = #ASKU
    * display = "asked but unknown"
    * target
      * code = #asked-unknown
      * display = "Asked But Unknown"
      * equivalence = #equivalent
  * element[+]
    * code = #NAV
    * display = "temporarily unavailable"
    * target
      * code = #temp-unknown
      * display = "Temporarily Unknown"
      * equivalence = #equivalent
  * element[+]
    * code = #NASK
    * display = "not asked"
    * target
      * code = #not-asked
      * display = "Not Asked"
      * equivalence = #equivalent
  * element[+]
    * code = #TRC
    * display = "trace"
    * target
      * code = #unsupported
      * display = "Unsupported"
      * equivalence = #wider
  * element[+]
    * code = #NP
    * display = "not present"
    * target
      * code = #unknown
      * display = "Unknown"
      * equivalence = #wider