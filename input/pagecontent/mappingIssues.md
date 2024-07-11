### Issues

We solicit feedback from balloters on several complex and pervasive issues.

#### Medications
US Core specifies that medication lists be accessible via a MedicationRequest query, regardless of whether the source system has the order. This means that CDA Medication Activity entries are mapped to MedicationRequest, and FHIR maps assume that MedicationRequest manifest all relevant medication data. We are interested in whether there are cases where these assumptions introduce risk or undue complexity.

#### Null flavors
US Core specifies that "unknown" is the generic null flavor, and should be used for, e.g., CDA "No Information." But CDA NullFlavors also has an "unknown" code. We opt, in this case, to follow the FHIR principle of not sending nulls without reason, so that a FHIR "unknown" will usually follow from a CDA "unknown." In cases where the FHIR property is required, we follow the US Core guidance, mapping "NI" to "unknown." This means that both CDA UNK and NI are mapped to FHIR UNK, but FHIR UNK is mapped to NI.

#### Provenance
FHIR documents do not provide context conduction, so all FHIR resources in a FHIR document should have explicit Provenance. It is permitted to also capture provenance data in resource properties, such as AllergyIntolerance.reporter. However, this property does not provide a date, so a Provenance resource seems to be required, thereby making the reporter property redundant. It may be populated for convenience, but doing so introduces opportunities for data inconsistency.

All CDA entries have authors, whether directly or via context conduction.

When generating FHIR documents from CDA, use Author participations (whether directly or via context conduction) to populate Provenance. 

When generating FHIR documents from FHIR, we propose that all resources be assigned Provenance resources. When translating these to CDA, use Provenance to populate Author participations. Application logic may be desirable to slot these authors in at the appropriate levels in cases where context conduction can reduce duplication.

We solicit feedback on the advisability of also populating resource provenance elements in either case.

While general guidance is to map Author participations to Provenance; at this time, we have no implementations to test that proposal.

Most identified instances of provenance use a small number of roles, but many roles are permitted. See the project page [https://confluence.hl7.org/display/CGP/Provenance+Domain](https://confluence.hl7.org/display/CGP/Provenance+Domain)for current thinking on how these roles should be mapped. 

#### Document-specificity of status codes
The CDA MedicationActivity template uses status values from the Medication Status value set. This set is constrained to values likely to be represented in documents; e.g., it does not contain a "new" or "held" value appropriate to a draft order, which would typically not be provided in a document. (Note that the inclusion of "nullified" on the CCDA side seems inconsistent.) Since we are mapping document to document, we can make a similar call on the FHIR side, even though the US Core profile supports the value "draft." We solicit perspectives on these options.

* Provide maps where possible (include "entered in error"; exclude "draft").
* Provide all maps. This means including a map for "draft" not provided in the C-CDA value set. Lobby SD for inclusion. 

* Only provide maps suitable for documents: exclude "draft" and "entered in error."

#### Absent Allergies

We solicit feedback on the use of CDA allergy value codes other than those we have mapped. We mapped the codes asserting "allergy" to the corresponding SNOMED codes for "no known allergy," and we left codes for "intolerance" and "propensity to adverse reaction" unmapped. The option would be to map those as well (e.g., negated "235719002	Intolerance to food (finding)" to "429625007 - No known food allergy (situation)").

We are aware that there are widely divergent perceptions and understandings of the distinctions among "allergy," "intolerance," and "propensity to adverse reaction." However, we also believe that the Allergy/Intolerance artifacts are not designed for clinical specificity, but rather as a safety tool to prevent administration of harmful substances. As a result, we believe that the physiological mechanism of the reaction is virtually irrelevant. 

Mechanism is sometimes used as a proxy for criticality, with "allergy" (and potential anaphylaxis) being the primary concern, so we would not want to generalize away from that term. Generalizing toward it (translating "intolerance" concepts as "allergy" concepts) may artificially inflate criticality assumptions, but not if the criticality element were assigned.

Finally, we believe that, as a safety mechanism, having accurate coded representations of present allergies is critically important to prevent administration of contraindicated substances, but the case for semantic specificity of negatives is less clear. Negatives don't play a part in order checks, and textual representations are easily understood by caregivers - notwithstanding the constraint that the question must be asked at every encounter anyway.

So it appears that neither not mapping (using only text) or mapping (representing all absence values as "allergies") is especially problematic.
