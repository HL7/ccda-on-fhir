Instance: Document-Consent
InstanceOf: Consent
Usage: #example
* meta
  * versionId = "7"
  * lastUpdated = "2020-08-13T00:30:34.762+00:00"
  * source = "#OBOGLY1IcS3QsGrB"
* status = #active
* scope = $consentscope#patient-privacy
* category = $loinc#59284-0
* patient = Reference(Document-Patient)
* dateTime = "2016-05-11"
* organization = Reference(Document-Organization-2)
* sourceAttachment
  * url = "http://example.org/not-a-real-consent-just-an-example-url.pdf"
  * title = "The terms of the consent in lawyer speak."
* policyRule = $v3-ActCode#OPTIN
* provision.period
  * start = "1964-01-01"
  * end = "2020-01-01"
