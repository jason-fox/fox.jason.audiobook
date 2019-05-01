<?xml version="1.0" encoding="UTF-8" ?>
<!--
  This file is part of the DITA-OT Audiobook Plug-in project.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:rx="http://www.renderx.com/XSL/Extensions"
    version="2.0">

    <!-- 
    	Available voices on the IBM Cloud
		
		see https://cloud.ibm.com/docs/services/text-to-speech?topic=text-to-speech-voices 
	-->

	
	<!-- Voices speaking in English -->
	<xsl:attribute-set name="__voice__en__male">
		<xsl:attribute name="voice">en-US_MichaelVoice</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en__female">
		<xsl:attribute name="voice">en-US_AllisonVoice</xsl:attribute>
	</xsl:attribute-set>
	<!-- Voices speaking in Regional English -->
	<xsl:attribute-set name="__voice__en-us__female">
		<xsl:attribute name="voice">en-US_AllisonVoice</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__en-us__female">
		<xsl:attribute name="voice">en-US_AllisonV2Voice</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en-us__female">
		<xsl:attribute name="voice">en-US_LisaVoice</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en-us__female">
		<xsl:attribute name="voice">en-US_LisaV2Voice</xsl:attribute>
	</xsl:attribute-set-->
	<xsl:attribute-set name="__voice__en-us__male">
		<xsl:attribute name="voice">en-US_MichaelVoice</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__en-us">
		<xsl:attribute name="voice">en-US_MichaelV2Voice</xsl:attribute>
	</xsl:attribute-set-->
	<xsl:attribute-set name="__voice__en-gb__female">
		<xsl:attribute name="voice">en-GB_KateVoice</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in French -->
	<xsl:attribute-set name="__voice__fr__female">
		<xsl:attribute name="voice">fr-FR_ReneeVoice</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in German -->
	<xsl:attribute-set name="__voice__de__female">
		<xsl:attribute name="voice">de-DE_BirgitVoice</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__de__female">
		<xsl:attribute name="voice">de-DE_BirgitV2Voice</xsl:attribute>
	</xsl:attribute-set-->
	<xsl:attribute-set name="__voice__de__male">
		<xsl:attribute name="voice">de-DE_DieterVoice</xsl:attribute>
	</xsl:attribute-set>


	<!-- Voices speaking in Italian -->
	<xsl:attribute-set name="__voice__it__female">
		<xsl:attribute name="voice">it-IT_FrancescaVoice</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__it__female">
		<xsl:attribute name="voice">it-IT_FrancescaV2Voice</xsl:attribute>
	</xsl:attribute-set-->


	<!-- Voices speaking in Japanese -->
	<xsl:attribute-set name="__voice__ja__female">
		<xsl:attribute name="voice">ja-JP_EmiVoice</xsl:attribute>
	</xsl:attribute-set>


	<!-- Voice speaking in Portuguese -->
	<xsl:attribute-set name="__voice__pt__female">
		<xsl:attribute name="voice">pt-BR_IsabelaVoice</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in Spanish -->
	<xsl:attribute-set name="__voice__es__male">
		<xsl:attribute name="voice">es-ES_EnriqueVoice</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__es__female">
		<xsl:attribute name="voice">es-ES_LauraVoice</xsl:attribute>
	</xsl:attribute-set>
	<!-- Voices speaking in Regional Spanish -->
	<xsl:attribute-set name="__voice__es-es__male">
		<xsl:attribute name="voice">es-ES_EnriqueVoice</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__es-es__female">
		<xsl:attribute name="voice">es-ES_LauraVoice</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__es-us__female">
		<xsl:attribute name="voice">es-US_SofiaVoice</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__es-la__female">
		<xsl:attribute name="voice">es-LA_SofiaVoice</xsl:attribute>
	</xsl:attribute-set>
	
	
</xsl:stylesheet>


