<?xml version="1.0" encoding="UTF-8"?>
<!-- This transform adds UUID extensions to to elements that need to become discrete resources when converted to FHIR. Used as a pre-processor in the cda2fhir.xslt file. -->
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://hl7.org/fhir"
	xmlns:xslt="http://www.w3.org/1999/XSL/Transform"
	xmlns:fhir="http://hl7.org/fhir"
	version="2.0"
	exclude-result-prefixes="fhir">
   
   <xsl:output method="xml" indent="yes" encoding="UTF-8" />
   <xsl:strip-space elements="*"/>   
   
   <xsl:template match="fhir:element/@id">
      <!-- Suppress -->
   </xsl:template>   
   
   <xsl:template match="fhir:system[@value='urn:oid:2.16.840.1.113883.6.1']">
      <system value="http://loinc.org"/>
   </xsl:template>
   
   <xsl:template match="fhir:definition[parent::fhir:element]">
      <!-- Suppress -->
   </xsl:template>
   
   <xsl:template match="fhir:comment[parent::fhir:element]">
      <!-- Suppress -->
   </xsl:template>
   
   <xsl:template match="fhir:sliceName">
      <xsl:choose>
         <xsl:when test="parent::fhir:element/fhir:short/@value">
            <xsl:variable name="lc-short" select="lower-case(parent::fhir:element/fhir:short/@value)"/>
            <xsl:variable name="newSliceName" select="translate($lc-short,' ','_')"/>
            <sliceName value="{$newSliceName}"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:copy>
               <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template match="@*|node()" >
      <xsl:copy>
         <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
   </xsl:template>
 
</xsl:stylesheet>
