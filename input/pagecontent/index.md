### Overview

Consolidated CDA (C-CDA) is one of the most widely implemented implementation guides for CDA and covers a significant scope of clinical care. Its target of the 'common/essential' elements of healthcare is closely aligned with FHIR's focus on the '80%'. There is significant interest in industry and government in the ability to interoperate between CDA and FHIR and C-CDA is a logical starting point. Implementers and regulators have both expressed an interest in the ability to map between FHIR and C-CDA.

This Implementation Guide (IG) defines a series of FHIR profiles on the Composition resource to represent the various document types in C-CDA and provides an initial mapping of C-CDA and FHIR content. To do the former, this IG profiles Composition for various document types and link the profiles created under the US Core project for any coded entries that would normally be included in C-CDA sections. To have a simpler, more streamlined standard that reuses existing work and focuses on the 80% that implementers actually need in production systems, the resources of US Core represents a portion of the 80% needed for coded entries of CCD, Care Plan & Discharge Summary.

The Composition profiles in this IG do not require coded data in any section. This is a departure from C-CDA, which requires coded data for Problems, Results, Medications, etc. This departure is intentional, as the C-CDA requirement for one or more coded entries in these sections resulted in some very complicated workarounds using nullFlavors to handle the fact that sometimes a patient is not on any medications, or has no current problems. In general, FHIR takes the approach that if something is nullable, it should simply be optional to ease the burden on implementers, thus C-CDA on FHIR does not require any coded entries, but rather uses the "required if known" approach, meaning that if an implementer's system has data for a section that requires data under Meaningful Use, they need to send it, but if they have no data there is no need for a null entry.

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<blockquote class="stu-note">
		<b>C-CDA ↔ FHIR Mapping</b>
		<p>The current release of this IG adds mapping content based on a separate <a href="https://jira.hl7.org/browse/PSS-1811">project</a> from earlier publications. These mappings are intended as informative and we welcome feedback on the content added under the "Mapping" tab. Feedback on parts of this implementation guide outside of C-CDA ↔ FHIR mapping <b>WILL NOT</b> be addressed as part of ballot reconciliation although may be logged for future consideration.</p>
	</blockquote>
</div>

### Scope

To represent Consolidated CDA Templates for Clinical Notes (C-CDA) 2.1 templates using FHIR profiles.

This first stage of the project defines all the C-CDA document-level profiles on the Composition resource and contained sections.

Any coded data used by sections will be represented using relevant U.S. Core FHIR profiles where they exist. FHIR profiles defined by other work groups or unconstrained FHIR resources may also be referenced if no appropriate US Core Profile exist.

For further information see the C-CDA specification here: http://www.hl7.org/implement/standards/product_brief.cfm?product_id=408.



### Authors (Composition Profiles, Extensions and CapabilityStatement )

<table>
<thead>
<tr>
<th>Name</th>
<th>Email/URL</th>
</tr>
</thead>
<tbody>
<tr>
<td>HL7 Structured Documents Working Group</td>
<td><a href="http://hl7.org/Special/committees/structure/index.cfm" target="_new">http://hl7.org/Special/committees/structure/index.cfm</a></td>
</tr>
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

### Authors (C-CDA ↔ FHIR Mapping)

<table>
<thead>
<tr>
<th>Name</th>
<th>Email/URL</th>
</tr>
</thead>
<tbody>
<tr>
<td>HL7 Cross Group Projects</td>
<td><a href="http://hl7.org/Special/committees/cgp/index.cfm" target="_new">http://www.hl7.org/Special/committees/cgp/index.cfm</a></td>
</tr>
<tr>
<td>HL7 Structured Documents Working Group</td>
<td><a href="http://hl7.org/Special/committees/structure/index.cfm" target="_new">http://hl7.org/Special/committees/structure/index.cfm</a></td>
</tr>
<tr>
<td>Jay Lyle</td>
<td><a href="mailto:jay.lyle@jpsys.com">jay.lyle@jpsys.com</a></td>
</tr>
<tr>
<td>John D'Amore</td>
<td><a href="mailto:johnd@moreinformatics.com">johnd@moreinformatics.com</a></td>
</tr>
<tr>
<td>Natalee Agassi</td>
<td><a href="mailto:natalee.agassi@oracle.com">natalee.agassi@oracle.com</a></td>
</tr>
<tr>
<td>Chun Li</td>
<td><a href="mailto:Chun.Li@availity.com">Chun.Li@availity.com</a></td>
</tr>
<tr>
<td>Ken Lord</td>
<td><a href="mailto:klord@mdixinc.com">klord@mdixinc.com</a></td>
</tr>
<tr>
<td>Catherine Hoang</td>
<td><a href="mailto:Catherine.Hoang2@va.gov">Catherine.Hoang2@va.gov</a></td>
</tr>
<tr>
<td>Bill Ormerod</td>
<td><a href="mailto:william.ormerod@oracle.com">william.ormerod@oracle.com</a></td>
</tr>

</tbody>
</table>



[Next Page - Background](background.html)
