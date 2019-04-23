<?xml version="1.0" encoding="UTF-8" ?>
<!--
  This file is part of the DITA-OT Audiobook Plug-in project.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">

    <xsl:import href="../cfg/attrs/watson.voice-attr.xsl"/>
	<xsl:output omit-xml-declaration="yes" indent="no"  method="text"/>
	<xsl:strip-space elements="*"/>

    <xsl:template name="processVoiceReflection">
        <xsl:param name="attrSet"/>
        <xsl:param name="path"/>
        <xsl:apply-templates select="document($path)//xsl:attribute-set[@name = $attrSet]"/>
    </xsl:template>

	<xsl:template match="meta" mode="meta-only">
		<xsl:if test="@name='DC.language'">
			<xsl:call-template name="processVoiceReflection">
			    <xsl:with-param name="attrSet" select="concat('__voice__', @content)"/>
			    <xsl:with-param name="path" select="'../cfg/attrs/watson.voice-attr.xsl'"/>
			</xsl:call-template>
        </xsl:if>
	</xsl:template>

	<xsl:template match="text()" mode="meta-only"/>


	<xsl:template match="/">
    	<xsl:apply-templates mode="meta-only"/>
  	</xsl:template>
</xsl:stylesheet>


