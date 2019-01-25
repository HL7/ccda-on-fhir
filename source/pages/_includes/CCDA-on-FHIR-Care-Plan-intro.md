---
title: StructureDefinition-CCDA-on-FHIR-Care-Plan-intro
layout: default
active: StructureDefinition-CCDA-on-FHIR-Care-Plan-intro
---

CARE PLAN FRAMEWORK: A Care Plan (including Home Health Plan of Care (HHPoC)) is a consensus-driven dynamic plan that represents a patient and Care Team Members prioritized concerns, goals, and planned interventions. It serves as a blueprint shared by all Care Team Members (including the patient, their caregivers and providers), to guide the patients care. A Care Plan integrates multiple interventions proposed by multiple providers and disciplines for multiple conditions.

A Care Plan represents one or more Plan(s) of Care and serves to reconcile and resolve conflicts between the various Plans of Care developed for a specific patient by different providers. While both a plan of care and a care plan include the patient's life goals and require Care Team Members (including patients) to prioritize goals and interventions, the reconciliation process becomes more complex as the number of plans of care increases. The Care Plan also serves to enable longitudinal coordination of care.

The Care Plan represents an instance of this dynamic Care Plan at a point in time. The composition itself is NOT dynamic.

Key differentiators between a Care Plan profile and CCD  profile (another snapshot in time document):

*  Requires relationships between various concepts:

        *  Health Concerns

        *  Interventions

        *  Goals

        *  Outcomes

*  Provides the ability to identify patient and provider priorities with each act

*  Provides a header participant to indicate occurrences of Care Plan review