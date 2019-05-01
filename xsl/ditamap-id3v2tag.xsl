<?xml version="1.0" encoding="UTF-8" ?>
<!--
  This file is part of the DITA-OT Audiobook Plug-in project.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">

	<xsl:output omit-xml-declaration="yes" indent="no"  method="text"/>

	<xsl:variable name="newline">
<xsl:text>
</xsl:text>
	</xsl:variable>

	<!--
		Avoid excess processing
	-->
	<xsl:template match="text()"/>

	<!--
		Add standard tags based on the ditamap
	-->
	<xsl:template match="/">
		<xsl:text>;FFMETADATA1</xsl:text>
		<xsl:value-of select="$newline"/>
		<xsl:text>genre=Audiobook</xsl:text>
		<xsl:value-of select="$newline"/>
		<xsl:text>title=</xsl:text>
		<xsl:value-of select="bookmap/booktitle/mainbooktitle"/>
		<xsl:value-of select="bookmap/title"/>
		<xsl:value-of select="$newline"/>
		<!-- additional tags based on the bookmeta -->
		<xsl:apply-templates select="bookmap/bookmeta"/>
	</xsl:template>

	<!-- author maps to id3v2 artist tag -->
	<xsl:template match="author">
		<xsl:text>artist=</xsl:text>
		<xsl:value-of select="."/>
		<xsl:value-of select="$newline"/>
	</xsl:template>

	<!-- shortdesc maps to id3v2 description and comment tag -->
	<xsl:template match="shortdesc">
		<xsl:text>description=</xsl:text>
		<xsl:value-of select="normalize-space(.)"/>
		<xsl:value-of select="$newline"/>
		<xsl:text>comment=</xsl:text>
		<xsl:value-of select="normalize-space(.)"/>
		<xsl:value-of select="$newline"/>
	</xsl:template>

	<!-- publisherinformation maps to id3v2 publisher tag -->
	<xsl:template match="publisherinformation">
		<xsl:text>publisher=</xsl:text>
		<xsl:value-of select="organization"/>
		<xsl:value-of select="$newline"/>
		<xsl:if test="published/completed/year">
			<xsl:text>year=</xsl:text>
			<xsl:value-of select="published/completed/year"/>
			<xsl:value-of select="$newline"/>
		</xsl:if>
	</xsl:template>

	<!-- bookrights maps to id3v2 copyright tag -->
	<xsl:template match="bookrights">
		<xsl:text>copyright=</xsl:text>
		<xsl:text>&#xA9; </xsl:text>
		<xsl:value-of select="copyrfirst/year"/>
		<xsl:if test="copyrlast/year">
			 <xsl:text>-</xsl:text>
			<xsl:value-of select="copyrlast/year"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:value-of select="bookowner/person"/>
		<xsl:value-of select="bookowner/organization"/>  
		<xsl:value-of select="$newline"/>
	</xsl:template>
</xsl:stylesheet>