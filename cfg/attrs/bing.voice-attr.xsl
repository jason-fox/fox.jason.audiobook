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
		Available voices on Microsoft Azure

		GET /cognitiveservices/voices/list HTTP/1.1
			Host: westus.tts.speech.microsoft.com
			Authorization: Bearer [Base64 access_token]

		see:  https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/rest-text-to-speech
	-->

	
	<!-- Voices speaking in Arabic -->
	<xsl:attribute-set name="__voice__ar">
		<xsl:attribute name="voice">ar-EG-Hoda</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__ar">
		<xsl:attribute name="voice">ar-SA-Naayf</xsl:attribute>
	</xsl:attribute-set-->

	<!-- Voice speaking in Bulgarian -->
	<xsl:attribute-set name="__voice__bg">
		<xsl:attribute name="voice">bg-BG-Ivan</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Catalan -->
	<xsl:attribute-set name="__voice__ca">
		<xsl:attribute name="voice">ca-ES-HerenaRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Czech -->
	<xsl:attribute-set name="__voice__cs">
		<xsl:attribute name="voice">cs-CZ-Jakub</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Danish -->
	<xsl:attribute-set name="__voice__da">
		<xsl:attribute name="voice">da-DK-HelleRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in German -->
	<xsl:attribute-set name="__voice__de">
		<xsl:attribute name="voice">de-DE-Stefan-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__de">
		<xsl:attribute name="voice">de-AT-Michael</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="__voice__de">
		<xsl:attribute name="voice">de-AT-Michael</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="__voice__de">
		<xsl:attribute name="voice">de-CH-Karsten</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="__voice__de">
		<xsl:attribute name="voice">de-DE-Hedda</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="__voice__de">
		<xsl:attribute name="voice">de-DE-HeddaRUS</xsl:attribute>
	</xsl:attribute-set-->


    <!-- Voice speaking in Greek -->
    <xsl:attribute-set name="__voice__el">
		<xsl:attribute name="voice">el-GR-Stefanos</xsl:attribute>
	</xsl:attribute-set>
 

   <!-- Voices speaking in English -->
   <xsl:attribute-set name="__voice__en">
		<xsl:attribute name="voice">en-US-ZiraRUS</xsl:attribute>
	</xsl:attribute-set>
    <!--xsl:attribute-set name="__voice__en">
		<xsl:attribute name="voice">en-AU-Catherine</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en">
		<xsl:attribute name="voice">en-AU-HayleyRUS</xsl:attribute>
	</xsl:attribute-set>
	 <xsl:attribute-set name="__voice__en">
		<xsl:attribute name="voice">en-CA-Linda</xsl:attribute>
	</xsl:attribute-set>
	 <xsl:attribute-set name="__voice__en">
		<xsl:attribute name="voice">en-CA-HeatherRUS</xsl:attribute>
	</xsl:attribute-set>
	 <xsl:attribute-set name="__voice__en">
		<xsl:attribute name="voice">en-GB-George-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en">
		<xsl:attribute name="voice">en-GB-HazelRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en">
		<xsl:attribute name="voice">en-GB-Susan-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en">
		<xsl:attribute name="voice">en-IE-Sean</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en">
		<xsl:attribute name="voice">en-IN-Heera-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en">
		<xsl:attribute name="voice">en-IN-PriyaRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en">
		<xsl:attribute name="voice">en-IN-Ravi-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en">
		<xsl:attribute name="voice">en-US-BenjaminRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en">
		<xsl:attribute name="voice">en-US-Guy24kRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en">
		<xsl:attribute name="voice">en-US-Jessa24kRUS</xsl:attribute>
	</xsl:attribute-set-->
	

	 <!-- Voices speaking in Spanish -->
    <xsl:attribute-set name="__voice__es">
		<xsl:attribute name="voice">es-ES-HelenaRUS</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__es">
		<xsl:attribute name="voice">es-ES-Laura-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__es">
		<xsl:attribute name="voice">es-ES-Pablo-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__es">
		<xsl:attribute name="voice">es-MX-HildaRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__es">
		<xsl:attribute name="voice">es-MX-Raul-Apollo</xsl:attribute>
	</xsl:attribute-set-->

	<!-- Voice speaking in Finnish -->
	<xsl:attribute-set name="__voice__fi">
		<xsl:attribute name="voice">fi-FI-HeidiRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in French -->
	<xsl:attribute-set name="__voice__fr">
		<xsl:attribute name="voice">fr-FR-Paul-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__fr">
		<xsl:attribute name="voice">fr-CA-Caroline</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__fr">
		<xsl:attribute name="voice">fr-CA-HarmonieRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__fr">
		<xsl:attribute name="voice">fr-CH-Guillaume</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__fr">
		<xsl:attribute name="voice">fr-FR-HortenseRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__fr">
		<xsl:attribute name="voice">fr-FR-Julie-Apollo</xsl:attribute>
	</xsl:attribute-set-->
	
	<!-- Voice speaking in Hebrew -->
	<xsl:attribute-set name="__voice__he">
		<xsl:attribute name="voice">he-IL-Asaf</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in Hindi -->
	<xsl:attribute-set name="__voice__hi">
		<xsl:attribute name="voice">hi-IN-Hemant</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__hi">
		<xsl:attribute name="voice">hi-IN-Kalpana-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__hi">
		<xsl:attribute name="voice">hi-IN-Kalpana</xsl:attribute>
	</xsl:attribute-set-->

	<!-- Voice speaking in Croat -->
	<xsl:attribute-set name="__voice__hr">
		<xsl:attribute name="voice">hr-HR-Matej</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Hungarian -->
	<xsl:attribute-set name="__voice__hu">
		<xsl:attribute name="voice">hu-HU-Szabolcs</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Bassa Indonesia -->
	<xsl:attribute-set name="__voice__id">
		<xsl:attribute name="voice">id-ID-Andika</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in Italian -->
	<xsl:attribute-set name="__voice__it">
		<xsl:attribute name="voice">it-IT-Cosimo-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__it">
		<xsl:attribute name="voice">it-IT-LuciaRUS</xsl:attribute>
	</xsl:attribute-set-->

	<!-- Voices speaking in Japanese -->
	<xsl:attribute-set name="__voice__ja">
		<xsl:attribute name="voice">ja-JP-Ayumi-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__ja">
		<xsl:attribute name="voice">ja-JP-HarukaRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__ja">
		<xsl:attribute name="voice">ja-JP-Ichiro-Apollo</xsl:attribute>
	</xsl:attribute-set-->

	<!-- Voice speaking in Korean -->
	<xsl:attribute-set name="__voice__ko">
		<xsl:attribute name="voice">ko-KR-HeamiRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Malay -->
	<xsl:attribute-set name="__voice__ms">
		<xsl:attribute name="voice">ms-MY-Rizwan</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Norwegian bokmål -->
	<xsl:attribute-set name="__voice__nb">
		<xsl:attribute name="voice">nb-NO-HuldaRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__no">
		<xsl:attribute name="voice">nb-NO-HuldaRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Dutch -->
	<xsl:attribute-set name="__voice__nl">
		<xsl:attribute name="voice">nl-NL-HannaRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Polish -->
	<xsl:attribute-set name="__voice__pl">
		<xsl:attribute name="voice">pl-PL-PaulinaRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in Portuguese -->
	<xsl:attribute-set name="__voice__pt">
		<xsl:attribute name="voice">pt-BR-HeloisaRUS</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__pt">
		<xsl:attribute name="voice">pt-BR-Daniel-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__pt">
		<xsl:attribute name="voice">pt-PT-HeliaRUS</xsl:attribute>
	</xsl:attribute-set-->

	<!-- Voice speaking in Romanian -->
	<xsl:attribute-set name="__voice__ro">
		<xsl:attribute name="voice">ro-RO-Andrei</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in Russian -->
	<xsl:attribute-set name="__voice__ru">
		<xsl:attribute name="voice">ru-RU-EkaterinaRUS</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__ru">
		<xsl:attribute name="voice">ru-RU-Irina-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__ru">
		<xsl:attribute name="voice">ru-RU-Pavel-Apollo</xsl:attribute>
	</xsl:attribute-set-->

	<!-- Voice speaking in Slovak -->
	<xsl:attribute-set name="__voice__sk">
		<xsl:attribute name="voice">sk-SK-Filip</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Slovene -->
	<xsl:attribute-set name="__voice__sl">
		<xsl:attribute name="voice">sl-SI-Lado</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Swedish -->
	<xsl:attribute-set name="__voice__sv">
		<xsl:attribute name="voice">sv-SE-HedvigRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Tamil -->
	<xsl:attribute-set name="__voice__ta">
		<xsl:attribute name="voice">ta-IN-Valluvar</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Telugu -->
	<xsl:attribute-set name="__voice__te">
		<xsl:attribute name="voice">te-IN-Chitra</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Thai -->
	<xsl:attribute-set name="__voice__th">
		<xsl:attribute name="voice">th-TH-Pattara</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Turkish -->
	<xsl:attribute-set name="__voice__tr">
		<xsl:attribute name="voice">tr-TR-SedaRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Vietnamese -->
	<xsl:attribute-set name="__voice__vi">
		<xsl:attribute name="voice">vi-VN-An</xsl:attribute>
	</xsl:attribute-set>


	<!-- Voices speaking in Chinese -->
	<xsl:attribute-set name="__voice__zh">
		<xsl:attribute name="voice">zh-CN-HuihuiRUS</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__zh">
		<xsl:attribute name="voice">zh-CN-Kangkang-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__zh">
		<xsl:attribute name="voice">zh-HK-Tracy-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__zh">
		<xsl:attribute name="voice">zh-HK-TracyRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__zh">
		<xsl:attribute name="voice">zh-HK-Danny-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__zh">
		<xsl:attribute name="voice">zh-TW-HanHanRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__zh">
		<xsl:attribute name="voice">zh-TW-Yating-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__zh">
		<xsl:attribute name="voice">zh-TW-Zhiwei-Apollo</xsl:attribute>
	</xsl:attribute-set-->

</xsl:stylesheet>
