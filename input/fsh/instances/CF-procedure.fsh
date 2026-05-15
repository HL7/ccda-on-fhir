Instance: CF-procedure
InstanceOf: Procedure
Usage: #example
* identifier[0]
  * value = "545069400001"
  * system = "urn:oid:1.3.6.1.4.1.22812.3.2009316.3.4.7"
* identifier[+]
  * system = "urn:oid:1.3.6.1.4.1.22812.3.2009316.3.4.7"
  * value = "545069400003"
* status = #completed
* code
  * text = "Excision of appendix"
  * coding[0] = $sct#80146002 "Excision of appendix"
  * coding[+] = $ICD10#0DBJ4ZZ "Excision of Appendix, Percutaneous Endoscopic Approach"
* subject = Reference(CF-patient)
* performedDateTime = "2012-08-06"