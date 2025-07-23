{% include stu-note.xml %}

### Overview

Consolidated CDA (C-CDA) is one of the most widely implemented implementation guides for CDA and covers a significant scope of clinical care. Its target of the 'common/essential' elements of healthcare is closely aligned with FHIR's focus on the '80%'. There is significant interest in industry and government in the ability to interoperate between CDA and FHIR and C-CDA is a logical starting point. Implementers and regulators have both expressed an interest in the ability to map between FHIR and C-CDA.

This Implementation Guide (IG) contains mapping guidance for creating FHIR resources from C-CDA documents. 

### Clinical Document Profiles

Prior versions of this IG included a series of FHIR profiles on the Composition resource to represent the various document types in C-CDA. This content has not been updated, and some of the guidance is now outdated. However, for implementers wishing to access these profiles, they are available in an older version of this IG: [C-CDA on FHIR STU 1.1](https://hl7.org/fhir/us/ccda/STU1.1/).

Additionally, the [FHIR Clinical Documents](https://hl7.org/fhir/uv/fhir-clinical-document/) is an updated profile demonstrating how to transfer clinical documents (the 'CD' of CDA) using FHIR Document Bundles and Composition Resources. Should this C-CDA-on-FHIR IG resurrect document profiles, they will build upon this already-completed work.


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
<td><a href="http://hl7.org/Special/committees/cgp" target="_new">http://hl7.org/Special/committees/cgp</a></td>
</tr>
<tr>
<td>HL7 Structured Documents Working Group</td>
<td><a href="http://hl7.org/Special/committees/structure" target="_new">http://hl7.org/Special/committees/structure</a></td>
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
<tr>
<td>Benjamin Flessner</td>
<td><a href="mailto:benjamin.flessner@availity.com">benjamin.flessner@availity.com</a></td>
</tr>
<tr>
<td>Brett Marquard</td>
<td><a href="mailto:brett@waveoneassociates.com">brett@waveoneassociates.com</a></td>
</tr>
<tr>
<td>Christopher Vitale</td>
<td><a href="mailto:Christopher.Vitale@availity.com">Christopher.Vitale@availity.com</a></td>
</tr>
  <tr>
<td>Sajjad Hussain</td>
<td><a href="mailto:sshussain@google.com">sshussain@google.com</a></td>
</tr>
<tr>
<td>Gene Beyer</td>
<td><a href="mailto:gene.beyer@oracle.com">gene.beyer@oracle.com</a></td>
</tr>
<tr>
<td>Gay Dolin</td>
<td><a href="mailto:gdolin@namasteinformatics.com">gdolin@namasteinformatics.com</a></td>
</tr>
<tr>
<td>Lisa Nelson</td>
<td><a href="mailto:LNelson@advaultinc.com">LNelson@advaultinc.com</a></td>
</tr>
<tr>
<td>Deb Loniewski</td>
<td><a href="mailto:loniewskid@michigan.gov">loniewskid@michigan.gov</a></td>
</tr>

</tbody>
</table>

### Dependencies

{% include dependency-table.xhtml %}

### IP Statements

{% include ip-statements.xhtml %}

