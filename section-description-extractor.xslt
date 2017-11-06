<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:lcg="http://www.lantanagroup.com"
    exclude-result-prefixes="lcg xsl xs xsi xhtml"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="ASCII"/>
    <xsl:variable name="docs" select="document('docs.xml')"/>
    
    <xsl:template match="/">
        <div>
            <!--
            <docs>
                <xsl:for-each select="//lcg:Template[@templateType='document']">
                    <doc>
                        <id><xsl:value-of select="@identifier"/></id>
                        <title><xsl:value-of select="@title"/></title>
                        <structuredefinition>TBD</structuredefinition>
                    </doc>
                </xsl:for-each>
            </docs>
            -->
            <h2>Section Descriptions</h2>
            <p>The section descriptions below are taken from Consolidated CDA R2.1, and are listed here for quick reference. In some cases minor modifications have been made where CDA specific concepts were mentioned that are not appropriate for FHIR.</p>
            <ul>
                <xsl:for-each select="//lcg:Template[@templateType='section']">
                    <xsl:sort select="@title"/>
                    <xsl:variable name="id" select="@identifier"/>
                    <xsl:variable name="sectitle">
                        <xsl:choose>
                            <xsl:when test="contains(@title,'(V')">
                                <xsl:value-of select="substring-before(@title,'(V')"/>
                            </xsl:when>
                            <xsl:otherwise><xsl:value-of select="@title"/></xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:if test="//lcg:Template[@templateType='document'][descendant::lcg:ContainedTemplate[@identifier=$id]]">
                        <li><a href="#{@bookmark}"><xsl:value-of select="$sectitle"/></a></li>
                    </xsl:if>
                </xsl:for-each>
            </ul>
            <xsl:for-each select="//lcg:Template[@templateType='section']">
                <xsl:sort select="@title"/>
                <xsl:variable name="id" select="@identifier"/>
                <xsl:variable name="sectitle">
                    <xsl:choose>
                        <xsl:when test="contains(@title,'(V')">
                            <xsl:value-of select="substring-before(@title,'(V')"/>
                        </xsl:when>
                        <xsl:otherwise><xsl:value-of select="@title"/></xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                
                <xsl:if test="//lcg:Template[@templateType='document'][descendant::lcg:ContainedTemplate[@identifier=$id]]">
                     <div>
                         <h3><a name="{@bookmark}"><xsl:value-of select="$sectitle"/></a></h3>
                         <xsl:apply-templates select="lcg:Description"/>
                             <p>Referenced in:
                             <ul>
                                 <xsl:for-each select="//lcg:Template[@templateType='document'][descendant::lcg:ContainedTemplate[@identifier=$id]]">
                                     <xsl:variable name="docid" select="@identifier"/>
                                     <xsl:variable name="doctitle">
                                         <xsl:choose>
                                             <xsl:when test="contains(@title,'(V')">
                                                 <xsl:value-of select="substring-before(@title,'(V')"/>
                                             </xsl:when>
                                             <xsl:otherwise><xsl:value-of select="@title"/></xsl:otherwise>
                                         </xsl:choose>
                                     </xsl:variable>
                                     
                                     <xsl:variable name="structuredefinition" select="$docs//lcg:doc[lcg:id=$docid]/lcg:structuredefinition"/>
                                     <li><a href="StructureDefinition-{$structuredefinition}.html"><xsl:value-of select="$doctitle"/></a></li>
                                 </xsl:for-each>
                             </ul>
                             </p>
                         
                     </div>
                </xsl:if>
            </xsl:for-each>
        </div>
    </xsl:template>
    
    
    <xsl:template match="lcg:Description[parent::lcg:Template[@identifier='urn:hl7ii:2.16.840.1.113883.10.20.22.2.17:2015-08-01']]">
        <p><xsl:value-of select="."/></p>
        <p>Note: in C-CDA birth sex is recorded in the social history section, but C-CDA on FHIR uses the US Core Patient profile for patient data, which itself contains a birth sex extension, so birth sex will be found on the Patient resource, not in this section. </p>
    </xsl:template>    
    
    <xsl:template match="lcg:Description[parent::lcg:Template[@identifier='urn:hl7ii:2.16.840.1.113883.10.20.22.2.9:2014-06-09']]">
        <p>This section represents the clinician’s conclusions and working assumptions that will guide treatment of the patient. The Assessment and Plan Section may be combined or separated to meet local policy requirements. See also the Assessment Section and Plan of Treatment Section</p>
    </xsl:template>    
    
    <xsl:template match="lcg:Description[parent::lcg:Template[@identifier='urn:hl7ii:2.16.840.1.113883.10.20.22.2.56:2015-08-01']]">
        <p>The Mental Status Section contains observations and evaluations related to a patient’s psychological and mental competency and deficits including, but not limited to any of the following types of information:</p>
        <ul>
            <li>Appearance (e.g., unusual grooming, clothing or body modifications)</li>
            <li>Attitude (e.g., cooperative, guarded, hostile)</li>
            <li>Behavior/psychomotor (e.g., abnormal movements, eye contact, tics)</li>
            <li>Mood and affect (e.g., anxious, angry, euphoric)</li>
            <li>Speech and Language (e.g., pressured speech, perseveration)</li>
            <li>Thought process (e.g., logic, coherence)</li>
            <li>Thought content (e.g., delusions, phobias)</li>
            <li>Perception (e.g., voices, hallucinations)</li>
            <li>Cognition (e.g., memory, alertness/consciousness, attention, orientation) – which were included in Cognitive Status Observation in earlier publications of C-CDA.</li>
            <li>Insight and judgment (e.g., understanding of condition, decision making)</li>
        </ul>
    </xsl:template>
    
    <xsl:template match="lcg:Description">
        <p><xsl:value-of select="."/></p>
    </xsl:template>
    
</xsl:stylesheet>