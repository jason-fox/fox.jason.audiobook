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
		language attribute sets 

		GET /cognitiveservices/voices/list HTTP/1.1
			Host: westus.tts.speech.microsoft.com
			Authorization: Bearer [Base64 access_token]

		see:  https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/rest-text-to-speech
	-->
	
	<xsl:attribute-set name="__language__ar-EG-Hoda">
		<xsl:attribute name="language">Egyptian Arabic</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__ar-SA-Naayf">
		<xsl:attribute name="language">Saudi Arabic</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__bg-BG-Ivan">
		<xsl:attribute name="language">Bulgar</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__ca-ES-HerenaRUS">
		<xsl:attribute name="language">Catalan</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__cs-CZ-Jakub">
		<xsl:attribute name="language">Czech</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__da-DK-HelleRUS">
		<xsl:attribute name="language">Danish</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__de-DE-Stefan-Apollo">
		<xsl:attribute name="language">German</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__de-AT-Michael">
		<xsl:attribute name="language">German</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__de-AT-Michael">
		<xsl:attribute name="language">Austrian German</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__de-CH-Karsten">
		<xsl:attribute name="language">Swiss German</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__de-DE-Hedda">
		<xsl:attribute name="language">German</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__de-DE-HeddaRUS">
		<xsl:attribute name="language">German</xsl:attribute>
	</xsl:attribute-set>
    <xsl:attribute-set name="__language__el-GR-Stefanos">
		<xsl:attribute name="language">Greek</xsl:attribute>
	</xsl:attribute-set>
   <xsl:attribute-set name="__language__en-US-ZiraRUS">
		<xsl:attribute name="language">US English</xsl:attribute>
	</xsl:attribute-set>
    <xsl:attribute-set name="__language__en-AU-Catherine">
		<xsl:attribute name="language">Australian English</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__en-AU-HayleyRUS">
		<xsl:attribute name="language">Australian English</xsl:attribute>
	</xsl:attribute-set>
	 <xsl:attribute-set name="__language__en-CA-Linda">
		<xsl:attribute name="language">Canadian English</xsl:attribute>
	</xsl:attribute-set>
	 <xsl:attribute-set name="__language__en-CA-HeatherRUS">
		<xsl:attribute name="language">Canadian English</xsl:attribute>
	</xsl:attribute-set>
	 <xsl:attribute-set name="__language__en-GB-George-Apollo">
		<xsl:attribute name="language">British English</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__en-GB-HazelRUS">
		<xsl:attribute name="language">British English</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__en-GB-Susan-Apollo">
		<xsl:attribute name="language">British English</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__en-IE-Sean">
		<xsl:attribute name="language">Irish English</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__en-IN-Heera-Apollo">
		<xsl:attribute name="language">Indian English</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__en-IN-PriyaRUS">
		<xsl:attribute name="language">Indian English</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__en-IN-Ravi-Apollo">
		<xsl:attribute name="language">Indian English</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__en-US-BenjaminRUS">
		<xsl:attribute name="language">US English</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__en-US-Guy24kRUS">
		<xsl:attribute name="language">US English</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__en-US-Jessa24kRUS">
		<xsl:attribute name="language">US English</xsl:attribute>
	</xsl:attribute-set>
    <xsl:attribute-set name="__language__es-ES-HelenaRUS">
		<xsl:attribute name="language">Castilian Spanish</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__es-ES-Laura-Apollo">
		<xsl:attribute name="language">Castilian Spanish</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__es-ES-Pablo-Apollo">
		<xsl:attribute name="language">Castilian Spanish</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__es-MX-HildaRUS">
		<xsl:attribute name="language">Latin American Spanish</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__es-MX-Raul-Apollo">
		<xsl:attribute name="language">Latin American Spanish</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__fi-FI-HeidiRUS">
		<xsl:attribute name="language">Finnish</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__fr-FR-Paul-Apollo">
		<xsl:attribute name="language">French</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__fr-CA-Caroline">
		<xsl:attribute name="language">Canadian French</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__fr-CA-HarmonieRUS">
		<xsl:attribute name="language">Canadian French</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__fr-CH-Guillaume">
		<xsl:attribute name="language">Swiss French</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__fr-FR-HortenseRUS">
		<xsl:attribute name="language">French</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__fr-FR-Julie-Apollo">
		<xsl:attribute name="language">French</xsl:attribute>
	</xsl:attribute-set>
	
	<!-- Voice speaking in Hebrew -->
	<xsl:attribute-set name="__language__he">
		<xsl:attribute name="language">he-IL-Asaf</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__hi-IN-Hemant">
		<xsl:attribute name="language">Hindi</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__hi-IN-Kalpana-Apollo">
		<xsl:attribute name="language">Hindi</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__hi-IN-Kalpana">
		<xsl:attribute name="language">Hindi</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__hr-HR-Matej">
		<xsl:attribute name="language">Croat</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__hu-HU-Szabolcs">
		<xsl:attribute name="language">Hungarian</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__id-ID-Andika">
		<xsl:attribute name="language">Bassa Indonesia</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__it-IT-Cosimo-Apollo">
		<xsl:attribute name="language">Italian</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__it-IT-LuciaRUS">
		<xsl:attribute name="language">Italian</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__ja-JP-Ayumi-Apollo">
		<xsl:attribute name="language">Japanese</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__ja-JP-HarukaRUS">
		<xsl:attribute name="language">Japanese</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__ja-JP-Ichiro-Apollo">
		<xsl:attribute name="language">Japanese</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__ko-KR-HeamiRUS">
		<xsl:attribute name="language">Korean</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__ms-MY-Rizwan">
		<xsl:attribute name="language">Malay</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__nb-NO-HuldaRUS">
		<xsl:attribute name="language">Norwegian Bokmål</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__nl-NL-HannaRUS">
		<xsl:attribute name="language">Dutch</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__pl-PL-PaulinaRUS">
		<xsl:attribute name="language">Polish</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__pt-BR-HeloisaRUS">
		<xsl:attribute name="language">Brazilian Portuguese</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__pt-BR-Daniel-Apollo">
		<xsl:attribute name="language">Brazilian Portuguese</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__pt-PT-HeliaRUS">
		<xsl:attribute name="language">Portuguese</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__ro-RO-Andrei">
		<xsl:attribute name="language">Romanian</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__ru-RU-EkaterinaRUS">
		<xsl:attribute name="language">Russian</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__ru-RU-Irina-Apollo">
		<xsl:attribute name="language">Russian</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__ru-RU-Pavel-Apollo">
		<xsl:attribute name="language">Russian</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__sk-SK-Filip">
		<xsl:attribute name="language">Slovak</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__sl-SI-Lado">
		<xsl:attribute name="language">Slovene</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__sv-SE-HedvigRUS">
		<xsl:attribute name="language">Swedish</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__ta-IN-Valluvar">
		<xsl:attribute name="language">Tamil</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__te-IN-Chitra">
		<xsl:attribute name="language">Telugu</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__th-TH-Pattara">
		<xsl:attribute name="language">Thai</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__tr-TR-SedaRUS">
		<xsl:attribute name="language">Turkish</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__vi-VN-An">
		<xsl:attribute name="language">Vietnamese</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__zh-CN-HuihuiRUS">
		<xsl:attribute name="language">Mainland Chinese</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__zh-CN-Kangkang-Apollo">
		<xsl:attribute name="language">Mainland Chinese</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__zh-HK-Tracy-Apollo">
		<xsl:attribute name="language">Hong Kong Chinese</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__zh-HK-TracyRUS">
		<xsl:attribute name="language">Hong Kong Chinese</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__zh-HK-Danny-Apollo">
		<xsl:attribute name="language">Hong Kong Chinese</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__zh-TW-HanHanRUS">
		<xsl:attribute name="language">Taiwanese Chinese</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__zh-TW-Yating-Apollo">
		<xsl:attribute name="language">Taiwanese Chinese</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__language__zh-TW-Zhiwei-Apollo">
		<xsl:attribute name="language">Taiwanese Chinese</xsl:attribute>
	</xsl:attribute-set>
</xsl:stylesheet>
