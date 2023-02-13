## Reading the C-CDA ↔ FHIR Mapping Pages 

### How to Read "Transform Steps" Column? 

When specific steps are included for mapping content between C-CDA and FHIR, those steps will be listed in the "Transform Steps" column in the following order: 

1. **Constraint (labeled in bold)**: Only perform the action when this constraint is fulfilled
2. **Guidance (Bidirectional guidance shown as ↔)**: Generalized narrative guidance on structural transform between CDA and FHIR elements. This links to section on this current page
3. **ConceptMap (Mapping direction shown as →)**: Link to a computable map between CDA and FHIR vocabularies. This links to conceptMaps listed on this [page](conceptMaps.html)
4. **Notes (no label)**: Other notes specific to this element mapping

### What Examples are Included?

Examples for C-CDA to FHIR transforms are provided based on a consensus of various vendors performing mappings. All vendors received the sample input (i.e. C-CDA Document) and the consensus output (i.e. FHIR Resource). 

The highlighted outputs were created using an open source tool for C-CDA ↔ FHIR Mapping developed as part of this project.  

## Guidance

### CDA id ↔ FHIR identifier

Text about what to do

### CDA ↔ FHIR Time/Dates

Text about what to do

### CDA xsi:type=CD ↔ FHIR CodeableConcept

Text about what to do

###  Guidance on CDA ↔ FHIR Provenance

Text about what to do
