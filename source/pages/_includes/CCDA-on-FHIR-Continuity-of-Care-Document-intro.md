---
title: StructureDefinition-CCDA-on-FHIR-Continuity-of-Care-Document-intro
layout: default
active: StructureDefinition-CCDA-on-FHIR-Continuity-of-Care-Document-intro
---

This profile was originally based on the Continuity of Care Document (CCD) Release 1.1 which itself was derived from HITSP C32 and CCD Release 1.0.

The Continuity of Care Document (CCD) profile represents a core data set of the most relevant administrative, demographic, and clinical information facts about a patient's healthcare, covering one or more healthcare encounters. It provides a means for one healthcare practitioner, system, or setting to aggregate all of the pertinent data about a patient and forward it to another to support the continuity of care.  

The primary use case for the CCD is to provide a snapshot in time containing the germane clinical, demographic, and administrative data for a specific patient. The key characteristic of a CCD is that the Composition.event.code is constrained to "PCPR". This means it does not function to report new services associated with performing care. It reports on care that has already been provided. The CCD provides a historical tally of the care over a range of time and is not a record of new services delivered.

More specific use cases, such as a Discharge Summary, Transfer Summary, Referral Note, Consultation Note, or Progress Note, are available as alternative profiles. 