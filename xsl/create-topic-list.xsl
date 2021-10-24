<?xml version="1.0" encoding="UTF-8"?>
<!--
  This file is part of the DITA-OT Audiobook Plug-in project.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

	<xsl:output omit-xml-declaration="yes" indent="no" method="text"/>
	<xsl:strip-space elements="*"/>

	<xsl:variable name="newline">
<xsl:text>
</xsl:text>
	</xsl:variable>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' map/topicref ')]">
    <xsl:if test="@href">
	  	<xsl:text>file </xsl:text>
	  	<xsl:call-template name="gethref">
          <xsl:with-param name="ditahref" select="@href"/>
        </xsl:call-template>
	  	<xsl:value-of select="$newline"/>
  	</xsl:if>

  	<xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="text()"/>



  <xsl:template name="gethref">
    <xsl:param name="ditahref"/>
    
    <xsl:if test="not(@scope='external')">
      <xsl:if test="contains($ditahref, '#')">
        <xsl:call-template name="swapext">
          <xsl:with-param name="newhref" select="substring-before($ditahref, '#')"/>
        </xsl:call-template>
      </xsl:if>

      <xsl:if test="not(contains($ditahref, '#'))">
        <xsl:call-template name="swapext">
          <xsl:with-param name="newhref" select="$ditahref"/>
        </xsl:call-template>
      </xsl:if>
    </xsl:if>

  </xsl:template>


  <xsl:template name="swapext">
    <xsl:param name="newhref"/>

    <xsl:if test="substring($newhref, string-length($newhref) - string-length('.xml') +1) = '.xml'">
      <xsl:value-of select="concat(substring-before($newhref, '.xml'), '.mp3')"/>
    </xsl:if>
    <xsl:if test="substring($newhref, string-length($newhref) - string-length('.dita') +1) =
      '.dita'">
      <xsl:value-of select="concat(substring-before($newhref, '.dita'), '.mp3')"/>
    </xsl:if>

  </xsl:template>

</xsl:stylesheet>
