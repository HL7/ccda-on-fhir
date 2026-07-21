# Ballot Question Log — January 2027 cycle

Questions to put to the ballot audience (or resolve in team review before ballot).
Working document, versioned with the repo. Cross-references: DECISIONS.md.

## Q-1 — Condition.recordedDate: "earliest author time" rule (from D-problem-1)

The CF-problems map says `.recordedDate` takes the **earliest** author time when
multiple authors exist. The previously published example used the latest (concern
act author, 2014-01-04) rather than the earliest (problem observation author,
2010-08-15). The regenerated example now follows the written rule. **Question:**
is "earliest" the intended rule, or should recordedDate reflect the concern act's
(wrapper's) author time? Consider aligning with the guidance for allergy concern
acts, which currently takes the act author without an earliest/latest rule.

## Q-2 — condition-assertedDate sourcing (from D-problem-1)

The map derives `condition-assertedDate` only from a Date of Diagnosis act
(77975-1). The previously published example asserted a date with no source. The
canonical pneumonia entry has no 77975-1 act, so the extension was removed from
the example. **Question:** should the map admit other sources for assertedDate
(e.g., problem observation effectiveTime/low as fallback)? **Option:** add a
77975-1 act to the pneumonia entry in a future Myra amendment so the map row is
demonstrated either way.

## Q-3 — Medication mood ↔ intent (from D-med-2; superseded if MedMaps lands first)

ConceptMap CF-MedActivityMood says EVN→plan, INT→order; the prior baked example
showed INT→plan and the vendor consensus mapped EVN→order. Placeholder values in
the current example follow the ConceptMap. Expected to be resolved by MedMaps
before ballot; listed here as a backstop.

## Q-4 — CF-medications STU note scope (from D-med-2)

The STU note claims maps cover moodCode=INT only, while the ConceptMap covers EVN.
Note text needs updating to whatever MedMaps decides.

## Q-5 — AllergyIntolerance.type for drug-propensity codes (from D-allergy-2)

CF-AllergyIntoleranceType deliberately maps 419511003 (and several peers) to no
type. Confirmed as intended 2026-07-20 (example carries no type). Listed for
ballot visibility since implementers may expect type=allergy.
