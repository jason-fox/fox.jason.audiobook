<?xml version="1.0" encoding="UTF-8"?>
<!--
  This file is part of the DITA-OT Audiobook Plug-in project.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <xsl:param name="VOICE" select="'en-US-ZiraRUS'"/>
  <xsl:variable name="LANG" select="substring-before($VOICE, '-')"/>
  <xsl:variable name="LANG_REGION" select="substring($VOICE, 0, 6)"/>
  <xsl:variable name="VOICE_ID" select="substring($VOICE, 7)"/>

  <!--
    Remove the outermost <speak> element then add an appropriate voice.
  -->

	<xsl:output omit-xml-declaration="yes" indent="no" method="xml"/>
	<!--xsl:strip-space elements="*"/-->

	<xsl:template match="/speak">
    <speak version="1.0">
      <xsl:attribute name="xml:lang">
        <xsl:value-of select="$LANG"/>
      </xsl:attribute>
      <voice>
         <xsl:attribute name="name">
            <xsl:text>Microsoft Server Speech Text to Speech Voice (</xsl:text>
            <xsl:value-of select="$LANG_REGION"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="$VOICE_ID"/>
            <xsl:text>)</xsl:text>
         </xsl:attribute>
		    <xsl:apply-templates/>
      </voice>
    </speak>
	</xsl:template>

	<xsl:template match="text()">
		<xsl:value-of select="normalize-space()"/>
		<xsl:text> </xsl:text>
	</xsl:template>

	<xsl:template match="*">
    <!-- remove element prefix -->
    <xsl:element name="{local-name()}">
      <!-- process attributes -->
      <xsl:for-each select="@*">
        <!-- remove attribute prefix -->
        <xsl:attribute name="{local-name()}">
          <xsl:value-of select="."/>
        </xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

	

	<xsl:template match="meta"/>

</xsl:stylesheet>
