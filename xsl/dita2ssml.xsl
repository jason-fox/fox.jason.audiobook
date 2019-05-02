<?xml version="1.0" encoding="UTF-8" ?>
<!--
  This file is part of the DITA-OT Audiobook Plug-in project.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
    exclude-result-prefixes="xs dita-ot"
    version="2.0">

  <xsl:import href="plugin:org.dita.base:xsl/common/dita-utilities.xsl"/>
  <xsl:import href="plugin:org.dita.base:xsl/common/output-message.xsl"/>
  <xsl:import href="./get-topic-meta.xsl"/>
  
  <xsl:variable name="msgprefix" select="'DOTX'"/>
  
  <xsl:output method="xml" encoding="UTF-8" indent="no" omit-xml-declaration="no" />

  <!--
    Add meta data such as title, author and copyright
  -->
  <xsl:template name="chapterHead">
    <xsl:apply-templates select="." mode="chapterHead"/>
  </xsl:template>
  <xsl:template match="*" mode="chapterHead">
    <xsl:call-template name="getMeta"/> 
  </xsl:template>

  
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  

  <xsl:template match="/dita | *[contains(@class, ' topic/topic ')]">
    <xsl:choose>
      <xsl:when test="not(parent::*)">
        <xsl:apply-templates select="." mode="root_element"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="." mode="child.topic"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  

  <xsl:template match="*" mode="root_element" name="root_element">
    <xsl:call-template name="chapter-setup"/>
  </xsl:template>

  <!--
    Mark up the whole topic as a <speak> element
  -->
  <xsl:template name="chapter-setup">
    <xsl:element name="speak">
        <xsl:attribute name="version">
          <xsl:text>1.1</xsl:text>
        </xsl:attribute>
        <xsl:attribute name=" xsi:schemaLocation">
          <xsl:text>http://www.w3.org/2001/10/synthesis http://www.w3.org/TR/speech-synthesis11/synthesis.xsd</xsl:text>
        </xsl:attribute>

        <xsl:attribute name="xml:lang">
          <xsl:call-template name="getLowerCaseLang"/>
        </xsl:attribute>

        <xsl:call-template name="chapterHead"/>    
        <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <!--
    For title elements add a <mark> and consider the title as a separate paragraph
  -->
  <xsl:template match="*[contains(@class, ' topic/topic ')]/*[contains(@class, ' topic/title ')]">
    <mark>
      <xsl:attribute name="name"><xsl:apply-templates select="." mode="return-aria-label-id"/></xsl:attribute>
    </mark>
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <!--
    If a paragraph is spoken in a foreign language add the xml:lang parameter.
    Paragraphs should be encapsulated with <p> tags to ensure the pace of the
    spoken words is correct.
  -->
  <xsl:template match="*[contains(@class, ' topic/p ')]" name="topic.p">
    <p>
      <xsl:if test="@xml:lang">
        <xsl:attribute name="xml:lang">
          <xsl:value-of select="@xml:lang"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <!--
    If a phrase is spoken in a foreign language add the xml:lang parameter
    to the word. Similarly add emphasis to words highlighted in bold
  -->
  <xsl:template match="*[contains(@class, ' topic/ph ')]" name="topic.ph">

    <xsl:variable name="lang">
      <xsl:value-of select="@xml:lang"/>
    </xsl:variable>

    <xsl:variable name="element">
      <xsl:choose>
        <xsl:when test="contains(@class,' hi-d/b ')">
          <xsl:text>emphasis</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(@props, 'emphasis')">
          <xsl:text>emphasis</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(@props, 'voice')">
          <xsl:text>voice</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(@props, 'say-as')">
          <xsl:text>say-as</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(@props, 'phoneme')">
          <xsl:text>phoneme</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(@props, 'sub')">
          <xsl:text>sub</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(@props, 'lang')">
          <xsl:text>lang</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(@props, 'break')">
          <xsl:text>break</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(@props, 'prosody')">
          <xsl:text>prosody</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(@props, 'audio')">
          <xsl:text>audio</xsl:text>
        </xsl:when>
        <xsl:when test="@xml:lang">
          <xsl:text>w</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(@props, 'voice-transformation')">
          <xsl:text>voice-transformation</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(@props, 'express-as')">
          <xsl:text>express-as</xsl:text>
        </xsl:when>
        <xsl:otherwise/>
      </xsl:choose>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="not($element='')">
        <xsl:element name="{$element}">
          <xsl:analyze-string select="@props" regex="[a-z]*\([^\)]*\)">
            <xsl:matching-substring>
              <xsl:variable name="var">
                <xsl:value-of select="."/>
              </xsl:variable>
              <xsl:variable name="attr">
                <xsl:value-of select="substring-before($var, '(')"/>
              </xsl:variable>
              <xsl:attribute name="{$attr}">
                <xsl:value-of select="substring-before(substring-after($var, '('),')')"/>
              </xsl:attribute>
            </xsl:matching-substring>
          </xsl:analyze-string>
          <xsl:if test="not($lang='')">
            <xsl:attribute name="xml:lang">
              <xsl:value-of select="$lang"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--
    For each list item add a short pause after it is spoken.
  -->
  <xsl:template match="*[contains(@class, ' topic/li ')]" name="topic.li">
    <xsl:apply-templates/>
    <break/>
  </xsl:template>

  <!--
    Ignore all codeblocks, images, tables and prolog as these are never spoken
  -->
  <xsl:template match="*[contains(@class,' pr-d/codeblock ')]"/>
  <xsl:template match="*[contains(@class,' topic/prolog ')]"/>
  <xsl:template match="*[contains(@class,' topic/table ')]"/>
  <xsl:template match="*[contains(@class,' topic/simpletable ')]"/>

  <xsl:template match="text()">
    <xsl:value-of select="."/>
    <xsl:text> </xsl:text>
  </xsl:template>

</xsl:stylesheet>
