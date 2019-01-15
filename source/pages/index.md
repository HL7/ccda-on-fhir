---
title: Implementation Guide HomePage
layout: default
active: home
---

{% include publish-box.html %}

<!-- { :.no_toc } -->

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

<!-- end TOC -->

### Description

Consolidated CDA (C-CDA) is one of the most widely implemented implementation guides for CDA and covers a significant scope of clinical care. Its target of the 'common/essential' elements of healthcare is closely aligned with FHIR's focus on the '80%'. There is significant interest in industry and government in the ability to interoperate between CDA and FHIR and C-CDA is a logical starting point. Implementers and regulators have both expressed an interest in the ability to map between FHIR and C-CDA.

This Implementation Guide (IG) defines a series of FHIR profiles on the Composition resource to represent the various document types in C-CDA. This release does not directly map every C-CDA template to FHIR profiles, rather tries to accomplish the C-CDA use case using Composition resource profiles created under this project (the equivalent of Level 2 CDA documents), and begins by linking to the profiles created under the US Core project for any coded entries that would normally be included in C-CDA sections. To have a simpler, more streamlined standard that reuses existing work and focuses on the 80% that implementers actually need in production systems, the resources of US Core represents a portion of the 80% needed for coded entries for coded entries of CCD, Care Plan & Discharge Summary).

The Composition profiles in this IG do not require coded data in any section. This is a departure from C-CDA, which requires coded data for Problems, Results, Medications, etc. This departure is intentional, as the C-CDA requirement for one or more coded entries in these sections resulted in some very complicated workarounds using nullFlavors to handle the fact that sometimes a patient is not on any medications, or has no current problems. In general, FHIR takes the approach that if something is nullable, it should simply be optional to ease the burden on implementers, thus C-CDA on FHIR does not require any coded entries, but rather uses the "required if known" approach, meaning that if an implementer's system has data for a section that requires data under Meaningful Use, they need to send it, but if they have no data there is no need for a null entry.

We encourage feedback on these Composition profiles, and the general approach to the project as a whole. We also encourage implementers who wish to see more of the coded data from C-CDA mapped to FHIR to comment on the US Core project and make their requests known there. Once US Core creates new profiles, this project can reference them.

## Scope

To represent Consolidated CDA Templates for Clinical Notes (C-CDA) 2.1 templates using FHIR profiles.

This first stage of the project defines all the C-CDA document-level profiles on the Composition resource and contained sections.

Any coded data used by sections will be represented using relevant U.S. Core FHIR profiles where they exist. FHIR profiles defined by other work groups or unconstrained FHIR resources may also be referenced if no appropriate US Core Profile exist.

## Implementation Notes

Implementers moving from C-CDA to FHIR need to be aware that the goal of this project is to address the same use case as Consolidated CDA (clinical documentation for primary and transfer of care scenarios in the US), but the syntax, methodologies, and value sets in FHIR are often quite different from those in C-CDA. In particular, implementers need to be aware of the issues listed below:

The value sets used in US Core and FHIR in general are not fully aligned with those in C-CDA.
The approaches for negation used in C-CDA and the Core FHIR specification are quite different.
The level of granularity between C-CDA templates and FHIR resources/profiles is often different, so there will not be a 1:1 mapping between templates and profiles. Some examples include:
Multiple templates like Health Concern and Problem Observation map to a single US Core Condition
C-CDA has 3 kids of procedure templates that all map to the single US Core Procedure profile
In C-CDA the use the moodCode attribute can differentiate between events and planned acts using a single template but in FHIR these are often separate resources (event vs. request resources)
In C-CDA multiple observations such as lab results are wrapped in an Organizer, whereas in FHIR the Observation resource itself can contain multiple Observations as subcomponents
Implementers need to follow the rules and apply the value sets used by the target specification, and this will often require significant data and vocabulary mapping. implementers moving from C-CDA to C-CDA on FHIR will need to review the US Core profiles and value sets in core FHIR resources and ensure that their instances FHIR instances are compliant. We hope that ongoing work in HL7 will better align US Core, C-CDA, and the Core FHIR specifications in the future.

We encourage implementers to refer to the ongoing C-CDA to FHIR mapping work that is described on the C-CDA on FHIR wiki page for assistance when moving from C-CDA to FHIR.



### Authors

<table>
<thead>
<tr>
<th>Name</th>
<th>Email</th>
</tr>
</thead>
<tbody>
<tr>
<td>Rick Geimer</td>
<td><a href="mailto:rick.geimer@lantanagroup.com">rick.geimer@lantanagroup.com</a></td>
</tr>
<tr>
<td>Sarah Gaunt</td>
<td><a href="mailto:sarah.gaunt@lantanagroup.com">sarah.gaunt@lantanagroup.com</a></td>
</tr>
<tr>
<td>Brett Marquard</td>
<td><a href="mailto:brett@riverrockassociates.com">brett@riverrockassociates.com</a></td>
</tr>
<tr>
<td>Corey Spears</td>
<td><a href="mailto:spears.corey@gmail.com">spears.corey@gmail.com</a></td>
</tr>
<tr>
<td>Meenaxi Gosai</td>
<td><a href="mailto:meenaxi.gosai@lantanagroup.com">meenaxi.gosai@lantanagroup.com</a></td>
</tr>
</tbody>
</table>


