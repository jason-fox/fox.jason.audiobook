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
		<xsl:if test="bookmap/bookmeta/author">
			<xsl:text>artist=</xsl:text>
			<xsl:value-of select="bookmap/bookmeta/author"/>
			<xsl:value-of select="$newline"/>
		</xsl:if>
		<xsl:if test="bookmap/bookmeta/shortdesc">
			<xsl:text>description=</xsl:text>
			<xsl:value-of select="normalize-space(bookmap/bookmeta/shortdesc)"/>
			<xsl:value-of select="$newline"/>
			<xsl:text>comment=</xsl:text>
			<xsl:value-of select="normalize-space(bookmap/bookmeta/shortdesc)"/>
			<xsl:value-of select="$newline"/>
		</xsl:if>
		<xsl:if test="bookmap/bookmeta/publisherinformation">
			<xsl:text>publisher=</xsl:text>
			<xsl:value-of select="bookmap/bookmeta/publisherinformation/organization"/>
			<xsl:value-of select="$newline"/>
		</xsl:if>
		<xsl:if test="bookmap/bookmeta/bookrights">
			<xsl:text>copyright=</xsl:text>
		    <xsl:text>&#xA9; </xsl:text>
			<xsl:value-of select="bookmap/bookmeta/bookrights/copyrfirst/year"/>
			<xsl:if test="bookmap/bookmeta/bookrights/copyrlast/year">
				 <xsl:text>-</xsl:text>
				<xsl:value-of select="bookmap/bookmeta/bookrights/copyrlast/year"/>
			</xsl:if>
			<xsl:text> </xsl:text>
			<xsl:value-of select="bookmap/bookmeta/bookrights/bookowner/person"/>
			<xsl:value-of select="bookmap/bookmeta/bookrights/bookowner/organization"/>  
			<xsl:value-of select="$newline"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>


