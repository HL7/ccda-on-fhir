Instance: Document-AllergyIntolerance
InstanceOf: AllergyIntolerance
Usage: #example
Description: "Supporting example instance (AllergyIntolerance) referenced by the document profile examples."
* meta
  * versionId = "7"
  * lastUpdated = "2020-08-12T21:30:13.331+00:00"
  * source = "#csn482LCsnDWyxbW"
* clinicalStatus = $allergyintolerance-clinical#active
* category = #medication
* criticality = #high
* code = $sct#387406002 "Sulfonamide (substance)"
  * text = "sulfonamide antibacterial"
* patient = Reference(Document-Patient) "Amy V. Shaw"
* reaction
  * manifestation = $sct#271807003 "skin rash"
    * text = "skin rash"
  * severity = #mild
