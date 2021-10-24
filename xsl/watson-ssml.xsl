<?xml version="1.0" encoding="UTF-8"?>
<!--
  This file is part of the DITA-OT Audiobook Plug-in project.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <!--
    Remove the outermost <speak> element to reduce the size of the
    payload to the text-to-speech server
  -->

	<xsl:output omit-xml-declaration="yes" indent="no" method="xml"/>
	<!--xsl:strip-space elements="*"/-->

	<xsl:template match="/speak">
		<xsl:apply-templates/>
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
