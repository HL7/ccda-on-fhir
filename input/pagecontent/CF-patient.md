<link rel="stylesheet" href="colors.css">

This page provides a mapping from CDA to FHIR. For the FHIR to CDA mapping, please refer to [Patient FHIR → CDA](./FC-patient.html). For guidance on how to read the table below, see [Reading the C-CDA ↔ FHIR Mapping Pages](./mappingGuidance.html)

<br />
<br />
### C-CDA to FHIR

|C-CDA¹<br/>[US Realm Header recordTarget](https://hl7.org/cda/us/ccda/3.0.0/StructureDefinition-USRealmHeader.html)|FHIR<br/>[Patient](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-patient.html#profile)|Transform Steps|
|:----|:----|:----|
|/id|.identifier|[CDA id ↔ FHIR identifier](mappingGuidance.html#cda-id--fhir-identifier)|
|/addr|.address|[CDA addr ↔ FHIR address ](mappingGuidance.html#cda-addr--fhir-address)|
|/telecom|.telecom|[CDA telecom ↔ FHIR telecom](mappingGuidance.html#cda-telecom--fhir-telecom)|
|/patient/name|.name|[CDA name ↔ FHIR name ](mappingGuidance.html#cda-name--fhir-name)|
|/patient/administrativeGenderCode|.gender|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>[CDA administrativeGender → FHIR gender](ConceptMap-CF-AdministrativeGender.html)|
|/patient/birthTime|.birthDate|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates) <br/>**Note:** the FHIR birthDate element is less precise than the CDA birthtime element. Precision can be preserved by also using the extension [`patient-birthTime`](https://hl7.org/fhir/R4/extension-patient-birthtime.html).|
|/patient/sdtc:deceasedInd|.deceasedBoolean|**Note:** Only one of `deceasedBoolean` or `deceasedDateTime` may exist. If both are present in CDA, use deceasedDateTime.
|/patient/sdtc:deceasedTime|.deceasedDateTime|[CDA ↔ FHIR Time/Dates](mappingGuidance.html#cda--fhir-timedates)
|/patient/maritalStatusCode|.maritalStatus|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)|
|/patient/religiousAffiliationCode|.extension:[patient-religion](https://hl7.org/fhir/extensions/StructureDefinition-patient-religion.html).valueCodeableConcept|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/patient/raceCode|.extension:[us-core-race](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-race.html): ombCategory|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>This should be a category and map to the ombCategory sub-extension. But if it is a detailed race, then it should go in the detailed sub-extension.|
|/patient/sdtc:raceCode|.extension:[us-core-race](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-race.html)|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>If code is in [OMB category](http://hl7.org/fhir/us/core/ValueSet/omb-race-category), use us-core-race: ombCategory; else use us-core-race: detailed.<br/>If the detailed race is under a different OMB category that the non-sdtc:raceCode element, then an additional OMB category sub-extension should be included as well.|
|/patient/raceCode/originalText<br/>and<br/>/patient/sdtc:raceCode/originalText|.extension:[us-core-race](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-race.html): text|The race extension's text sub-extension is required but may only exist once. Recommendation is to comma-delimit all originalText / displayNames available, taking care to not duplicate values.
|/patient/ethnicGroupCode|.extension:[us-core-ethnicity](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-ethnicity.html)|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>This should be a category and map to the ombCategory sub-extension. But if it is a detailed race, then it should go in the detailed sub-extension.|
|/patient/sdtc:ethnicGroupCode|.extension:[us-core-ethnicity](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-ethnicity.html) : detailed|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>Used for detailed ethnicity|
|/patient/guardian/code<br/>and<br/>/patient/guardian/guardianPerson/sdtc:asPatientRelationship/code|.contact.relationship|First, add a fixed relationship code of  `GUARD` from [v3 RoleCode](http://terminology.hl7.org/CodeSystem/v3-RoleCode) (`http://terminology.hl7.org/CodeSystem/v3-RoleCode`) to preserve the CDA guardian relationship. Then map the two fields to additional relationship entries using [CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)
|/patient/guardian/addr|.contact.address|[CDA addr ↔ FHIR address ](mappingGuidance.html#cda-addr--fhir-address)|
|/patient/guardian/telecom|.contact.telecom|[CDA telecom ↔ FHIR telecom](mappingGuidance.html#cda-telecom--fhir-telecom)|
|/patient/guardian/guardianPerson/name|.contact.name|[CDA name ↔ FHIR name ](mappingGuidance.html#cda-name--fhir-name)|
|/patient/birthPlace/place/addr|.extension:[patient-birthPlace](http://hl7.org/fhir/StructureDefinition/patient-birthPlace).valueAddress|[CDA addr ↔ FHIR address ](mappingGuidance.html#cda-addr--fhir-address)|
|/patient/languageCommunication/languageCode|.communication.language||
|/patient/languageCommunication/preferenceInd|.communication.preferred||
|/patient/languageCommunication/modeCode|.communication.extension:[patient-proficiency](http://hl7.org/fhir/StructureDefinition/patient-proficiency):type|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>If both modeCode and proficiencyLevelCode are set for a language, only one `patient-proficiency` extension is needed.
|/patient/languageCommunication/proficiencyLevelCode|.communication.extension:[patient-proficiency](http://hl7.org/fhir/StructureDefinition/patient-proficiency):level|[CDA coding ↔ FHIR CodeableConcept](mappingGuidance.html#cda-coding--fhir-codeableconcept)<br/>If both modeCode and proficiencyLevelCode are set for a language, only one `patient-proficiency` extension is needed.
|/providerOrganization|.managingOrganization|

1\. XPath abbrievated for C-CDA US Realm recordTarget as: <br/> ClinicalDocument/recordTarget/patientRole

### Example

<table><tr><th>CDA RecordTarget Example</th><th>FHIR Patient Resource</th></tr>
<tr><td>
<div id="cda" class="border codeArea">&lt;<span class="field">recordTarget</span>&gt;
  &lt;<span class="field">patientRole</span>&gt;
    &lt;<span class="field">id</span> <span class="attrib">root=</span><span class="value">"<mark class="color10">068F3166-5721-4D69-94ED-8278FF035B8A</mark>"</span> /&gt;
    &lt;<span class="field">addr</span> <span class="attrib">use=</span><mark class="color11"><span class="value">"H"</span></mark>&gt;
      &lt;<span class="field">streetAddressLine</span>&gt;<mark class="color12">1357 Amber Drive</mark>&lt;/<span class="field">streetAddressLine</span>&gt;
      &lt;<span class="field">city</span>&gt;<mark class="color13">Beaverton</mark>&lt;/<span class="field">city</span>&gt;
      &lt;<span class="field">state</span>&gt;OR&lt;/<span class="field">state</span>&gt;
      &lt;<span class="field">postalCode</span>&gt;<mark class="color14">97006</mark>&lt;/<span class="field">postalCode</span>&gt;
    &lt;/<span class="field">addr</span>&gt;
    &lt;<span class="field">telecom</span> <span class="attrib">value=</span><span class="value">"tel:<mark class="color15">+1(565)867-5309</mark>"</span> <span class="attrib">use=</span><span class="value">"MC"</span>/&gt;
    &lt;<span class="field">patient</span>&gt;
      &lt;<span class="field">name</span> <span class="attrib">use=</span><span class="value">"L"</span>&gt;
        &lt;<span class="field">given</span>&gt;<mark class="color16">Myra</mark>&lt;/<span class="field">given</span>&gt;
        &lt;<span class="field">family</span>&gt;<mark class="color17">Jones</mark>&lt;/<span class="field">family</span>&gt;
      &lt;/<span class="field">name</span>&gt;
      &lt;<span class="field">administrativeGenderCode</span> 
        <span class="attrib">code=</span><mark class="color18"><span class="value">"F"</span></mark> 
        <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.5.1"</span> /&gt;
      &lt;<span class="field">birthTime</span> <span class="attrib">value=</span><span class="value">"<mark class="color19">19470501</mark>"</span> /&gt;
      &lt;<span class="field">sdtc:deceasedInd</span> <span class="attrib">value=</span><span class="value">"<mark class="color20">false</mark>"</span> /&gt;
      &lt;<span class="field">maritalStatusCode</span> 
        <span class="attrib">code=</span><mark class="color21"><span class="value">"M"</span></mark> 
        <span class="attrib">displayName=</span><span class="value">"<mark class="color22">Married</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.5.2"</span> 
        <span class="attrib">codeSystemName=</span><span class="value">"MaritalStatus"</span>/&gt;
      &lt;<span class="field">religiousAffiliationCode</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color23">1013</mark>"</span> 
        <span class="attrib">displayName=</span><span class="value">"<mark class="color24">Christian (non-Catholic, non-specific)</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.5.1076"</span> 
        <span class="attrib">codeSystemName=</span><span class="value">"HL7 Religious Affiliation"</span>/&gt;
      &lt;<span class="field">raceCode</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color25">2106-3</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color26">2.16.840.1.113883.6.238</mark>"</span> 
        <span class="attrib">displayName=</span><span class="value">"<mark class="color27">White</mark>"</span> /&gt;
      &lt;<span class="field">sdtc:raceCode</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color28">2108-9</mark>"</span> 
        <span class="attrib">displayName=</span><span class="value">"<mark class="color29">European</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color26">2.16.840.1.113883.6.238</mark>"</span> /&gt;
      &lt;<span class="field">ethnicGroupCode</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color30">2135-2</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color26">2.16.840.1.113883.6.238</mark>"</span> 
        <span class="attrib">displayName=</span><span class="value">"<mark class="color31">Hispanic or Latino</mark>"</span> /&gt;
      &lt;<span class="field">sdtc:ethnicGroupCode</span> 
        <span class="attrib">code=</span><span class="value">"<mark class="color32"><mark class="color32">20146-9</mark></mark>"</span> 
        <span class="attrib">displayName=</span><span class="value">"<mark class="color33">Spanish Basque</mark>"</span> 
        <span class="attrib">codeSystem=</span><span class="value">"<mark class="color26">2.16.840.1.113883.6.238</mark>"</span> /&gt;
      &lt;<span class="field">guardian</span>&gt;
        &lt;<span class="field">code</span> 
          <span class="attrib">code=</span><mark class="color34"><span class="value">"FTH"</span></mark> 
          <span class="attrib">displayName=</span><span class="value">"<mark class="color35">father</mark>"</span> 
          <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.5.111"</span> 
          <span class="attrib">codeSystemName=</span><span class="value">"RoleCode"</span> /&gt;
        &lt;<span class="field">addr</span> <span class="attrib">use=</span><mark class="color11"><span class="value">"H"</span></mark>&gt;
          &lt;<span class="field">streetAddressLine</span>&gt;<mark class="color36">123 main street</mark>&lt;/<span class="field">streetAddressLine</span>&gt;
          &lt;<span class="field">city</span>&gt;<mark class="color13">Beaverton</mark>&lt;/<span class="field">city</span>&gt;
          &lt;<span class="field">state</span>&gt;OR&lt;/<span class="field">state</span>&gt;
          &lt;<span class="field">postalCode</span>&gt;<mark class="color37">97867</mark>&lt;/<span class="field">postalCode</span>&gt;
        &lt;/<span class="field">addr</span>&gt;
        &lt;<span class="field">telecom</span> <span class="attrib">value=</span><span class="value">"tel:<mark class="color38">+1(555)555-2008</mark>"</span> <span class="attrib">use=</span><span class="value">"MC"</span> /&gt;
        &lt;<span class="field">guardianPerson</span>&gt;
          &lt;<span class="field">name</span>&gt;
            &lt;<span class="field">given</span>&gt;<mark class="color39">Boris</mark>&lt;/<span class="field">given</span>&gt;
            &lt;<span class="field">given</span> <span class="attrib">qualifier=</span><span class="value">"CL"</span><mark class="color40">&gt;Bo&lt;</mark>/given&gt;
            &lt;<span class="field">family</span>&gt;<mark class="color41">Betterhalf</mark>&lt;/<span class="field">family</span>&gt;
          &lt;/<span class="field">name</span>&gt;
        &lt;/<span class="field">guardianPerson</span>&gt;
      &lt;/<span class="field">guardian</span>&gt;
      &lt;<span class="field">birthplace</span>&gt;
        &lt;<span class="field">place</span>&gt;
          &lt;<span class="field">addr</span>&gt;
            &lt;<span class="field">streetAddressLine</span>&gt;<mark class="color42">4444 Birth Street</mark>&lt;/<span class="field">streetAddressLine</span>&gt;
            &lt;<span class="field">city</span>&gt;<mark class="color13">Beaverton</mark>&lt;/<span class="field">city</span>&gt;
            &lt;<span class="field">state</span>&gt;OR&lt;/<span class="field">state</span>&gt;
            &lt;<span class="field">postalCode</span>&gt;<mark class="color37">97867</mark>&lt;/<span class="field">postalCode</span>&gt;
          &lt;/<span class="field">addr</span>&gt;
        &lt;/<span class="field">place</span>&gt;
      &lt;/<span class="field">birthplace</span>&gt;
      &lt;<span class="field">languageCommunication</span>&gt;
        &lt;<span class="field">languageCode</span> <span class="attrib">code=</span><mark class="color10"><span class="value">"en"</span></mark> /&gt;
        &lt;<span class="field">modeCode</span> 
          <span class="attrib">code=</span><mark class="color11"><span class="value">"ESP"</span></mark> 
          <span class="attrib">displayName=</span><span class="value">"<mark class="color12">Expressed spoken</mark>"</span> 
          <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.5.60"</span> 
          <span class="attrib">codeSystemName=</span><span class="value">"LanguageAbilityMode"</span>/&gt;
        &lt;<span class="field">proficiencyLevelCode</span> 
          <span class="attrib">code=</span><mark class="color13"><span class="value">"G"</span></mark> 
          <span class="attrib">displayName=</span><span class="value">"<mark class="color14">Good</mark>"</span> 
          <span class="attrib">codeSystem=</span><span class="value">"2.16.840.1.113883.5.61"</span> 
          <span class="attrib">codeSystemName=</span><span class="value">"LanguageAbilityProficiency"</span>/&gt;
        &lt;<span class="field">preferenceInd</span> <span class="attrib">value=</span><span class="value">"<mark class="color15">true</mark>"</span> /&gt;
      &lt;/<span class="field">languageCommunication</span>&gt;
    &lt;/<span class="field">patient</span>&gt;
    <span class="comment">&lt;!-- Creates reference: <mark class="color16">Organization/PCPartnersTest</mark> --&gt;</span>
    &lt;<span class="field">providerOrganization</span>&gt;
      &lt;<span class="field">id</span> <span class="attrib">extension=</span><span class="value">"3"</span> <span class="attrib">root=</span><span class="value">"1.3.6.1.4.1.22812.3.2009316.3"</span> /&gt;
      &lt;<span class="field">name</span>&gt;Primary Care's Partners Test&lt;/<span class="field">name</span>&gt;
      &lt;<span class="field">telecom</span> <span class="attrib">use=</span><span class="value">"WP"</span> <span class="attrib">value=</span><span class="value">"tel:+1-(676)857-6769"</span> /&gt;
    &lt;/<span class="field">providerOrganization</span>&gt;
  &lt;/<span class="field">patientRole</span>&gt;
&lt;/<span class="field">recordTarget</span>&gt;</div>
</td><td>
<div id="fhir" class="border codeArea">{
  "<span class="field">resourceType</span>": "<span class="value">Patient</span>",
  "<span class="field">id</span>": "<span class="value">6581e92eb6ff5dadc088eae5</span>",
  "<span class="field">identifier</span>": [{
    "<span class="field">system</span>": "<span class="value">urn:uuid:<mark class="color10">068f3166-5721-4d69-94ed-8278ff035b8a</mark></span>",
    "<span class="field">value</span>": "<span class="value">urn:ietf:rfc:3986</span>"
  }],
  "<span class="field">language</span>": "<span class="value">en-US</span>",
  "<span class="field">extension</span>": [{
    "<span class="field">url</span>": "<span class="value">http://hl7.org/fhir/StructureDefinition/patient-religion</span>",
    "<span class="field">valueCodeableConcept</span>": {
      "<span class="field">coding</span>": [{
        "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/v3-ReligiousAffiliation</span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color23">1013</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color24">Christian (non-Catholic, non-specific)</mark></span>"
      }]
    }
  }, {
    "<span class="field">url</span>": "<span class="value">http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity</span>",
    "<span class="field">extension</span>": [{
      "<span class="field">url</span>": "<span class="value">ombCategory</span>",
      "<span class="field">valueCoding</span>": {
        "<span class="field">system</span>": "<span class="value">urn:oid:<mark class="color26">2.16.840.1.113883.6.238</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color30">2135-2</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color31">Hispanic or Latino</mark></span>"
      }
    }, {
      "<span class="field">url</span>": "<span class="value">text</span>",
      "<span class="field">valueString</span>": "<span class="value"><mark class="color31">Hispanic or Latino</mark>, <mark class="color33">Spanish Basque</mark></span>"
    }, {
      "<span class="field">url</span>": "<span class="value">detailed</span>",
      "<span class="field">valueCoding</span>": {
        "<span class="field">system</span>": "<span class="value">urn:oid:<mark class="color26">2.16.840.1.113883.6.238</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color32"><mark class="color32">20146-9</mark></mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color33">Spanish Basque</mark></span>"
      }
    }]
  }, {
    "<span class="field">url</span>": "<span class="value">http://hl7.org/fhir/us/core/StructureDefinition/us-core-race</span>",
    "<span class="field">extension</span>": [{
      "<span class="field">url</span>": "<span class="value">ombCategory</span>",
      "<span class="field">valueCoding</span>": {
        "<span class="field">system</span>": "<span class="value">urn:oid:<mark class="color26">2.16.840.1.113883.6.238</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color25">2106-3</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color27">White</mark></span>"
      }
    }, {
      "<span class="field">url</span>": "<span class="value">text</span>",
      "<span class="field">valueString</span>": "<span class="value"><mark class="color27">White</mark>, <mark class="color29">European</mark></span>"
    }, {
      "<span class="field">url</span>": "<span class="value">detailed</span>",
      "<span class="field">valueCoding</span>": {
        "<span class="field">system</span>": "<span class="value">urn:oid:<mark class="color26">2.16.840.1.113883.6.238</mark></span>",
        "<span class="field">code</span>": "<span class="value"><mark class="color28">2108-9</mark></span>",
        "<span class="field">display</span>": "<span class="value"><mark class="color29">European</mark></span>"
      }
    }]
  },
  {
    "<span class="field">url</span>": "<span class="value">http://hl7.org/fhir/StructureDefinition/patient-birthPlace</span>",
    "<span class="field">valueAddress</span>": {
      "<span class="field">line</span>": ["<mark class="color42">4444 Birth Street</mark>"],
      "<span class="field">city</span>": "<span class="value"><mark class="color13">Beaverton</mark></span>",
      "<span class="field">state</span>": "<span class="value">OR</span>",
      "<span class="field">postalCode</span>": "<span class="value"><mark class="color37">97867</mark></span>"
    }
  }],
  "<span class="field">name</span>": [{
    "<span class="field">text</span>": "<span class="value"><mark class="color16">Myra</mark> <mark class="color17">Jones</mark></span>",
    "<span class="field">use</span>": "<span class="value">usual</span>",
    "<span class="field">family</span>": "<span class="value"><mark class="color17">Jones</mark></span>",
    "<span class="field">given</span>": ["<mark class="color16">Myra</mark>"]
  }],
  "<span class="field">telecom</span>": [{
      "<span class="field">system</span>": "<span class="value">phone</span>",
    "<span class="field">value</span>": "<span class="value"><mark class="color15">+1(565)867-5309</mark></span>",
    "<span class="field">use</span>": "<span class="value">mobile</span>"
  }],
  "<span class="field">gender</span>": "<span class="value"><mark class="color18">female</mark></span>",
  "<span class="field">birthDate</span>": "<span class="value"><mark class="color19">1947-05-01</mark></span>",
  "<span class="field">deceasedBoolean</span>": <mark class="color20">false</mark>,
  "<span class="field">address</span>": [{
    "<span class="field">use</span>": "<span class="value"><mark class="color11">home</mark></span>",
    "<span class="field">text</span>": "<span class="value"><mark class="color12">1357 Amber Drive</mark> <mark class="color13">Beaverton</mark> OR <mark class="color14">97006</mark></span>",
    "<span class="field">line</span>": ["<mark class="color12">1357 Amber Drive</mark>"],
    "<span class="field">city</span>": "<span class="value"><mark class="color13">Beaverton</mark></span>",
    "<span class="field">state</span>": "<span class="value">OR</span>",
    "<span class="field">postalCode</span>": "<span class="value"><mark class="color14">97006</mark></span>"
  }],
  "<span class="field">maritalStatus</span>": {
    "<span class="field">coding</span>": [{
      "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/v3-MaritalStatus</span>",
      "<span class="field">code</span>": <mark class="color21">"M"</mark>,
      "<span class="field">display</span>": "<span class="value"><mark class="color22">Married</mark></span>"
    }]
  },
  "<span class="field">contact</span>": [{
    "<span class="field">relationship</span>": [{
      "<span class="field">coding</span>": [{
        "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/v3-RoleCode</span>",
        "<span class="field">code</span>": "<span class="value">GUARD</span>",
        "<span class="field">display</span>": "<span class="value">Guardian</span>"
      }]
    }, {
      "<span class="field">coding</span>": [{
        "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/v3-RoleCode</span>",
        "<span class="field">code</span>": <mark class="color34">"FTH"</mark>,
        "<span class="field">display</span>": "<span class="value"><mark class="color35">father</mark></span>"
      }]
    }],
    "<span class="field">name</span>": {
      "<span class="field">family</span>": "<span class="value"><mark class="color41">Betterhalf</mark></span>",
      "<span class="field">given</span>": [
        "<mark class="color39">Boris</mark>",
        <mark class="color40">"Bo"</mark>
      ]
    },
    "<span class="field">telecom</span>": [{
      "<span class="field">system</span>": "<span class="value">phone</span>",
      "<span class="field">value</span>": "<span class="value"><mark class="color38">+1(555)555-2008</mark></span>",
      "<span class="field">use</span>": "<span class="value">mobile</span>"
    }],
    "<span class="field">address</span>": {
      "<span class="field">use</span>": "<span class="value"><mark class="color11">home</mark></span>",
      "<span class="field">line</span>": ["<mark class="color36">123 main street</mark>"],
      "<span class="field">city</span>": "<span class="value"><mark class="color13">Beaverton</mark></span>",
      "<span class="field">state</span>": "<span class="value">OR</span>",
      "<span class="field">postalCode</span>": "<span class="value"><mark class="color37">97867</mark></span>"
    }
  }],
  "<span class="field">communication</span>": [{
    "<span class="field">language</span>": {
      "<span class="field">coding</span>": [{
        "<span class="field">system</span>": "<span class="value">urn:ietf:bcp:47</span>",
        "<span class="field">code</span>": <mark class="color10">"en"</mark>,
        "<span class="field">display</span>": "<span class="value">English</span>"
      }]
    },
    "<span class="field">preferred</span>": <mark class="color15">true</mark>,
    "<span class="field">extension</span>": [{
      "<span class="field">url</span>": "<span class="value">http://hl7.org/fhir/StructureDefinition/patient-proficiency</span>",
      "<span class="field">extension</span>": [{
        "<span class="field">url</span>": "<span class="value">level</span>",
        "<span class="field">valueCoding</span>": {
          "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/v3-LanguageAbilityProficiency</span>",
          "<span class="field">code</span>": <mark class="color13">"G"</mark>,
          "<span class="field">display</span>": "<span class="value"><mark class="color14">Good</mark></span>"
        }
      }, {
        "<span class="field">url</span>": "<span class="value">type</span>",
        "<span class="field">valueCoding</span>": {
          "<span class="field">system</span>": "<span class="value">http://terminology.hl7.org/CodeSystem/v3-LanguageAbilityMode</span>",
          "<span class="field">code</span>": <mark class="color11">"ESP"</mark>,
          "<span class="field">display</span>": "<span class="value"><mark class="color12">Expressed spoken</mark></span>"
        }
      }]
    }]
  }],
  "<span class="field">managingOrganization</span>": {
    "<span class="field">reference</span>": "<span class="value"><mark class="color16">Organization/PCPartnersTest</mark></span>"
  }
}</div>
</td></tr></table>

#### Links to example content

The consensus mapping example developed through multiple vendors are available below:
* [Patient CDA example](./Binary-CF-patient.html)
* [Patient FHIR example](./Patient-CF-patient.html)