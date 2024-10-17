<style>
td, th {
   border: 1px solid black!important;
}
</style>

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Vitals FHIR → CDA](./FC-vitals.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html).

C-CDA vitals are typically grouped into a Vital Signs Organizer to group one or more vitals readings together. This has been mapped to an additional FHIR Observation for the panel of vital signs. This panel contains a `.hasMember` field which references each observation mapped from the original C-CDA Vital Signs Organizer.

### C-CDA Vital Signs Organizer to FHIR Observation Panel

|C-CDA¹<br/>[Vital SignsOrganizer](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-VitalSignsOrganizer.html)|FHIR<br/>[Vital Signs Observation](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
||.category|Set to `vital-signs` from [Vital Signs value set](https://hl7.org/fhir/us/core/STU4/ValueSet-us-core-vital-signs.html)
||.code|Set to `85353-1` [CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/statusCode|.status|`final` (C-CDA is fixed to `completed`)
|/effectiveTime|.effectiveDateTime<br/>or<br/>.effectivePeriod|If low and high are identical, use effectiveDateTime. If organizer/effectiveTime is missing, use the earliest and latest observation/effectiveTime as the source of the mapping.<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
||.hasMember|Reference to each vital sign observation mapped from CDA

### C-CDA Vital Signs Observation to FHIR Observation

|C-CDA¹<br/>[Vital Sign Observation](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-VitalSignObservation.html)|FHIR<br/>[Vital Signs Observation](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html)|Transform Steps<br/>Note: US Core defines separate profiles for individual vitals such as [weight](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-body-weight.html), [heart rate](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-heart-rate.html), etc.|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
||.category|Set to `vital-signs` from [Vital Signs value set](https://hl7.org/fhir/us/core/STU4/ValueSet-us-core-vital-signs.html)
|/code |.code²|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/effectiveTime|.effectiveDateTime<br/>or<br/>.effectivePeriod|Prefer effectiveDateTime<br/>[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|value|.valueQuantity²|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)
|/interpretationCode|.interpretation²|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/methodCode|.method|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/targetSiteCode|.bodySite|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/author|.performer<br/>&<br/>**[Provenance](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-procedure.html)**|[CDA ↔ FHIR Provenance](mappingGuidance.html#cda--fhir-provenance)|
|/referenceRange/observationRange/interpretationCode|**Not Supported**|FHIR expects reference ranges to be "normal" ranges. If C-CDA includes multiple reference ranges, only map the one with interpretationCode = `"N"`.
|/referenceRange/observationRange/value[xsi:type=IVL_PQ]|.referenceRange.low²<br/>&<br/>.referenceRange.high²|[CDA ↔ FHIR Quantity](mappingGuidance.html#cda--fhir-quantity)
|/referenceRange/observationRange/value[xsi:type=ST]<br/>or<br/>/referenceRange/observationRange/text|.referenceRange.text²|

1\. XPath abbreviated for C-CDA Vital Signs Observation as: <br/> ClinicalDocument/component/structuredBody/component/section[code/@code="8716-3"]/entry/organizer/entryRelationship/component

2\. Some C-CDA observations need special handling when converting to FHIR. When recording the following vitals, the value, interpretation, and referenceRange should be placed in a `.component` element within a parent Observation.

**[Blood Pressure](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-blood-pressure.html)** (LOINC codes `8480-6` - systolic & `8462-4` - diastolic)
- Set `Observation.code` to `85354-9` (Blood Pressure Panel) and create 2 components for the systolic and diastolic readings. Both components are required.
- Do not send `Observation.valueQuantity`

**[Pulse Oximetry](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-pulse-oximetry.html)** (LOINC codes `3150-0` - Inhaled Oxygen Concentration & `3151-8` - Inhaled Oxygen Flow Rate)
- `Observation.code` should contain two coding values: `59408-5` & `2708-6`
- Observation.valueQuantity represents the Oxygen saturation (e.g. `98%`)
- Create individual components for `3150-0` - Inhaled Oxygen Concentration & `3151-8` - Inhaled Oxygen Flow Rate

### Illustrative example
...
### Links to example content
...
### Prior work and Expanded Spreadsheets
...