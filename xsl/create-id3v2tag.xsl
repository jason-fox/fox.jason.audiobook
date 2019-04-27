<?xml version="1.0" encoding="UTF-8" ?>
<!--
  This file is part of the DITA-OT Audiobook Plug-in project.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">

  <xsl:import href="../cfg/attrs/watson.language-attr.xsl"/>
  <xsl:import href="../cfg/attrs/bing.voice-attr.xsl"/>

  <!-- Input parameters (with defaults) -->
  <xsl:param name="TRACK" select="'1'"/>
  <xsl:param name="GENRE" select="'101'"/>
  <xsl:param name="VOICE" select="'en-US_MichaelVoice'"/>
  <xsl:param name="SERVICE" select="'watson'"/>

	<xsl:output omit-xml-declaration="yes" indent="no"  method="text"/>

	<xsl:variable name="newline">
<xsl:text>
</xsl:text>
	</xsl:variable>

	<!--
		Obtain the appropriate plain text description of the speech spoken
		based on the voice used.
	-->
  <xsl:template name="processLanguageReflection">
      <xsl:param name="attrSet"/>
      <xsl:param name="path"/>
      <xsl:apply-templates select="document($path)//xsl:attribute-set[@name = $attrSet]"/>
  </xsl:template>

  <!--
		Add additional tags based on the meta data found in the SSML file
  -->
	<xsl:template match="meta" mode="meta-only">
		<xsl:choose>
			<xsl:when test="@name='rights'">
				<xsl:text>copyright=</xsl:text>
				<xsl:value-of select="@content"/>
				<xsl:value-of select="$newline"/>
			</xsl:when>
			<xsl:when test="@name='DC.isPartOf'">
				<xsl:text>album=</xsl:text>
				<xsl:value-of select="@content"/>
				<xsl:value-of select="$newline"/>
			</xsl:when>
			<xsl:when test="@name='DC.title'">
				<xsl:text>title=</xsl:text>
				<xsl:value-of select="@content"/>
				<xsl:value-of select="$newline"/>
			</xsl:when>
			<xsl:when test="@name='DC.creator'">
				<xsl:text>artist=</xsl:text>
				<xsl:value-of select="@content"/>
				<xsl:value-of select="$newline"/>
			</xsl:when>
			<xsl:when test="@name='DC.publisher'">
				<xsl:text>publisher=</xsl:text>
				<xsl:value-of select="@content"/>
				<xsl:value-of select="$newline"/>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!--
		Avoid excess processing
	-->
	<xsl:template match="text()" mode="meta-only"/>

	<!--
		Add standard tags based on the input parameters.
	-->
	<xsl:template match="/">
		<xsl:text>;FFMETADATA1</xsl:text>
		<xsl:value-of select="$newline"/>
    	<xsl:apply-templates mode="meta-only"/>
		<xsl:text>genre=</xsl:text>
		<xsl:value-of select="$GENRE"/>
		<xsl:value-of select="$newline"/>
		<xsl:text>track=</xsl:text>
		<xsl:value-of select="$TRACK"/>
		<xsl:value-of select="$newline"/>
		<xsl:text>language=</xsl:text>
		<xsl:variable name="language">
			 <xsl:choose>
        <xsl:when test="$SERVICE='bing'">
          <xsl:call-template name="processLanguageReflection">
						<xsl:with-param name="attrSet" select="concat('__language__', $VOICE)"/>
						<xsl:with-param name="path" select="'../cfg/attrs/bing.language-attr.xsl'"/>
					</xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
					<xsl:call-template name="processLanguageReflection">
						<xsl:with-param name="attrSet" select="concat('__language__', $VOICE)"/>
						<xsl:with-param name="path" select="'../cfg/attrs/watson.language-attr.xsl'"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="normalize-space($language)"/>
		<xsl:value-of select="$newline"/>
  </xsl:template>
</xsl:stylesheet>


