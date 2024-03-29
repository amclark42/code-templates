<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:array="http://www.w3.org/2005/xpath-functions/array"
  xmlns:fn="http://www.w3.org/2005/xpath-functions"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:wwp="http://www.wwp.northeastern.edu/ns/textbase"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns=""
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="#all"
  version="3.0">
  
<!--
    ...
    
    Ash Clark
    2023
  -->
  
  <xsl:output encoding="UTF-8" indent="no" method="xml" omit-xml-declaration="no"/>
  
 <!--  PARAMETERS  -->
 <!--  GLOBAL VARIABLES  -->
  
  
 <!--  IDENTITY TEMPLATES  -->
  
  <xsl:template match="*" mode="#all">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="#current"/>
      <xsl:apply-templates mode="#current"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="@* | text() | comment() | processing-instruction()" mode="#all">
    <xsl:copy/>
  </xsl:template>
  
  
 <!--  TEMPLATES, #default mode  -->
  
  <!-- Put each leading processing instruction on its own line. -->
  <xsl:template match="/processing-instruction()">
    <xsl:if test="position() = 1">
      <xsl:text>&#x0A;</xsl:text>
    </xsl:if>
    <xsl:copy/>
    <xsl:text>&#x0A;</xsl:text>
  </xsl:template>
  
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  
  
 <!--  NAMED TEMPLATES  -->
  
 <!--  FUNCTIONS  -->
  
</xsl:stylesheet>