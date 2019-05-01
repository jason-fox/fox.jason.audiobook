<?xml version="1.0" encoding="UTF-8" ?>
<!--
  This file is part of the DITA-OT Audiobook Plug-in project.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">

  <xsl:import href="../cfg/attrs/watson.voice-attr.xsl"/>
  <xsl:import href="../cfg/attrs/bing.voice-attr.xsl"/>

  <!-- Input parameter (with defaults) -->
  <xsl:param name="SERVICE" select="'watson'"/>
  <xsl:param name="GENDER" select="'male'"/>
	
  <xsl:output omit-xml-declaration="yes" indent="no"  method="text"/>
	<xsl:strip-space elements="*"/>

  <!--
    Obtain the appropriate voice id to process the SSML based on the language used.
  -->
  <xsl:template name="processVoiceReflection">
      <xsl:param name="attrSet"/>
      <xsl:param name="path"/>
      <xsl:apply-templates select="document($path)//xsl:attribute-set[@name = $attrSet]"/>
  </xsl:template>

   <xsl:template name="getVoice">
      <xsl:param name="lang"/>
      <xsl:param name="gender"/>
      <xsl:choose>
        <xsl:when test="$SERVICE='bing'">
          <xsl:call-template name="processVoiceReflection">
            <xsl:with-param name="attrSet" select="concat('__voice__', $lang, '__', $gender)"/>
            <xsl:with-param name="path" select="'../cfg/attrs/bing.voice-attr.xsl'"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="processVoiceReflection">
            <xsl:with-param name="attrSet" select="concat('__voice__', $lang, '__', $gender)"/>
            <xsl:with-param name="path" select="'../cfg/attrs/watson.voice-attr.xsl'"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
  </xsl:template>

	<xsl:template match="meta[@name='DC.language']" mode="meta-only">
		<xsl:variable name="full-male">
      <xsl:call-template name="getVoice">
        <xsl:with-param name="lang" select="@content"/>
        <xsl:with-param name="gender" select="'male'"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="short-male">
        <xsl:call-template name="getVoice">
          <xsl:with-param name="lang" select="substring(@content, 1, 2)"/>
          <xsl:with-param name="gender" select="'male'"/>
        </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="full-female">
      <xsl:call-template name="getVoice">
        <xsl:with-param name="lang" select="@content"/>
        <xsl:with-param name="gender" select="'female'"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="short-female">
        <xsl:call-template name="getVoice">
          <xsl:with-param name="lang" select="substring(@content, 1, 2)"/>
          <xsl:with-param name="gender" select="'female'"/>
        </xsl:call-template>
    </xsl:variable>

    <xsl:if test="$GENDER='male'">
      <xsl:choose>
        <xsl:when test="$full-male">
          <xsl:value-of select="$full-male"/>
        </xsl:when>
        <xsl:when test="$short-male">
          <xsl:value-of select="$short-male"/>
        </xsl:when>
        <xsl:when test="$full-female">
          <xsl:value-of select="$full-female"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$short-female"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
    <xsl:if test="$GENDER='female'">
      <xsl:choose>
        <xsl:when test="$full-female">
          <xsl:value-of select="$full-female"/>
        </xsl:when>
        <xsl:when test="$short-female">
          <xsl:value-of select="$short-female"/>
        </xsl:when>
        <xsl:when test="$full-male">
          <xsl:value-of select="$full-male"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$short-male"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
	</xsl:template>

	<xsl:template match="text()" mode="meta-only"/>


	<xsl:template match="/">
    	<xsl:apply-templates mode="meta-only"/>
  	</xsl:template>
</xsl:stylesheet>


