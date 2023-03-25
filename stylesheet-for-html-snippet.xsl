<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:array="http://www.w3.org/2005/xpath-functions/array"
  xmlns:fn="http://www.w3.org/2005/xpath-functions"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:wwp="http://www.wwp.northeastern.edu/ns/textbase"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns="http://www.w3.org/1999/xhtml"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="#all"
  version="3.0">
  
<!--
    ...
    
    Ash Clark
    2023
  -->
  
  <xsl:output encoding="UTF-8" indent="no" media-type="text/html" method="xhtml" 
     omit-xml-declaration="no"/>
  <xsl:preserve-space elements="*"/>
  
  
 <!--  PARAMETERS  -->
  <xsl:param name="full-html-page" select="false()" as="xs:boolean"/>
  
 <!--  GLOBAL VARIABLES  -->
  
  
 <!--  IDENTITY TEMPLATES  -->
  
  <xsl:template match="*" mode="#all">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template match="@* | text() | comment() | processing-instruction()" mode="#all">
    <xsl:copy/>
  </xsl:template>
  
  
 <!--  TEMPLATES, #default mode  -->
  
  <xsl:template match="/">
    <xsl:variable name="content">
      <xsl:apply-templates/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$full-html-page">
        <xsl:call-template name="wrap-page-content">
          <xsl:with-param name="content" select="$content"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy-of select="$content"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  
 <!--  NAMED TEMPLATES  -->
  
  <xsl:template name="wrap-page-content">
    <xsl:param name="content" as="node()*"/>
    <html lang="en">
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title></title>
        <!--  CSS  -->
        <link rel="stylesheet" type="text/css" href="../assets/css/intertextuality.main.css" />
        <!--  JS  -->
      </head>
      <body>
        
        <div id="main">
          <xsl:copy-of select="$content"/>
        </div>
      </body>
    </html>
  </xsl:template>
  
 <!--  FUNCTIONS  -->
  
</xsl:stylesheet>