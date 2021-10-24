<?xml version="1.0" encoding="UTF-8"?>
<!--
  This file is part of the DITA-OT Audiobook Plug-in project.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:rx="http://www.renderx.com/XSL/Extensions"
  version="2.0"
>

    <!-- 
		Available voices on Microsoft Azure

		GET /cognitiveservices/voices/list HTTP/1.1
			Host: westus.tts.speech.microsoft.com
			Authorization: Bearer [Base64 access_token]

		see:  https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/rest-text-to-speech
	-->

	
	<!-- Voices speaking in Arabic -->
	<xsl:attribute-set name="__voice__ar__female">
		<xsl:attribute name="voice">ar-EG-Hoda</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__ar__male">
		<xsl:attribute name="voice">ar-SA-Naayf</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Bulgarian -->
	<xsl:attribute-set name="__voice__bg__male">
		<xsl:attribute name="voice">bg-BG-Ivan</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Catalan -->
	<xsl:attribute-set name="__voice__ca__female">
		<xsl:attribute name="voice">ca-ES-HerenaRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Czech -->
	<xsl:attribute-set name="__voice__cs__male">
		<xsl:attribute name="voice">cs-CZ-Jakub</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Danish -->
	<xsl:attribute-set name="__voice__da__female">
		<xsl:attribute name="voice">da-DK-HelleRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in German -->
	<xsl:attribute-set name="__voice__de__male">
		<xsl:attribute name="voice">de-DE-Stefan-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__de__female">
		<xsl:attribute name="voice">de-DE-Hedda</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in Regional German -->
	<xsl:attribute-set name="__voice__de-de__male">
		<xsl:attribute name="voice">de-DE-Stefan-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__de-at__male">
		<xsl:attribute name="voice">de-AT-Michael</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__de-ch__male">
		<xsl:attribute name="voice">de-CH-Karsten</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__de-de__female">
		<xsl:attribute name="voice">de-DE-Hedda</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__de-de__female">
		<xsl:attribute name="voice">de-DE-HeddaRUS</xsl:attribute>
	</xsl:attribute-set-->


    <!-- Voice speaking in Greek -->
    <xsl:attribute-set name="__voice__el__male">
		<xsl:attribute name="voice">el-GR-Stefanos</xsl:attribute>
	</xsl:attribute-set>
 

   <!-- Voices speaking in English -->

   <xsl:attribute-set name="__voice__en__male">
		<xsl:attribute name="voice">en-US-BenjaminRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en__female">
		<xsl:attribute name="voice">en-US-Jessa24kRUS</xsl:attribute>
	</xsl:attribute-set>
   
	<!-- Voices speaking in Regional English -->


    <xsl:attribute-set name="__voice__en-au__female">
		<xsl:attribute name="voice">en-AU-Catherine</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__en-au__female">
		<xsl:attribute name="voice">en-AU-HayleyRUS</xsl:attribute>
	</xsl:attribute-set-->
	<xsl:attribute-set name="__voice__en-ca__female">
		<xsl:attribute name="voice">en-CA-Linda</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__en-ca__female">
		<xsl:attribute name="voice">en-CA-HeatherRUS</xsl:attribute>
	</xsl:attribute-set-->
	<xsl:attribute-set name="__voice__en-gb__male">
		<xsl:attribute name="voice">en-GB-George-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en-gb__female">
		<xsl:attribute name="voice">en-GB-HazelRUS</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__en-gb__female">
		<xsl:attribute name="voice">en-GB-Susan-Apollo</xsl:attribute>
	</xsl:attribute-set-->
	<xsl:attribute-set name="__voice__en-ie__male">
		<xsl:attribute name="voice">en-IE-Sean</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en-in__female">
		<xsl:attribute name="voice">en-IN-Heera-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__en-in__female">
		<xsl:attribute name="voice">en-IN-PriyaRUS</xsl:attribute>
	</xsl:attribute-set-->
	<xsl:attribute-set name="__voice__en-in__male">
		<xsl:attribute name="voice">en-IN-Ravi-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__en-us__male">
		<xsl:attribute name="voice">en-US-BenjaminRUS</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__en__male">
		<xsl:attribute name="voice">en-US-Guy24kRUS</xsl:attribute>
	</xsl:attribute-set-->
	<xsl:attribute-set name="__voice__en-us__female">
		<xsl:attribute name="voice">en-US-Jessa24kRUS</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__en-us__female">
		<xsl:attribute name="voice">en-US-ZiraRUS</xsl:attribute>
	</xsl:attribute-set-->
	

	 <!-- Voices speaking in Spanish -->
    <xsl:attribute-set name="__voice__es__female">
		<xsl:attribute name="voice">es-ES-HelenaRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__es__male">
		<xsl:attribute name="voice">es-ES-Pablo-Apollo</xsl:attribute>
	</xsl:attribute-set>
	 <!-- Voices speaking in Regional Spanish -->
	<xsl:attribute-set name="__voice__es-es__female">
		<xsl:attribute name="voice">es-ES-HelenaRUS</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__es__female">
		<xsl:attribute name="voice">es-ES-Laura-Apollo</xsl:attribute>
	</xsl:attribute-set-->
	<xsl:attribute-set name="__voice__es-es__male">
		<xsl:attribute name="voice">es-ES-Pablo-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__es-mx__female">
		<xsl:attribute name="voice">es-MX-HildaRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__es-mx__male">
		<xsl:attribute name="voice">es-MX-Raul-Apollo</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Finnish -->
	<xsl:attribute-set name="__voice__fi__female">
		<xsl:attribute name="voice">fi-FI-HeidiRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in French -->
	<xsl:attribute-set name="__voice__fr__male">
		<xsl:attribute name="voice">fr-FR-Paul-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__fr__female">
		<xsl:attribute name="voice">fr-FR-HortenseRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in Regional French -->
	<xsl:attribute-set name="__voice__fr-fr__male">
		<xsl:attribute name="voice">fr-FR-Paul-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__fr-ca__female">
		<xsl:attribute name="voice">fr-CA-Caroline</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__fr-ca__female">
		<xsl:attribute name="voice">fr-CA-HarmonieRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__fr-ch__male">
		<xsl:attribute name="voice">fr-CH-Guillaume</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__fr-fr__female">
		<xsl:attribute name="voice">fr-FR-HortenseRUS</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__fr-fr__female">
		<xsl:attribute name="voice">fr-FR-Julie-Apollo</xsl:attribute>
	</xsl:attribute-set-->
	
	<!-- Voice speaking in Hebrew -->
	<xsl:attribute-set name="__voice__he__male">
		<xsl:attribute name="voice">he-IL-Asaf</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in Hindi -->
	<xsl:attribute-set name="__voice__hi__male">
		<xsl:attribute name="voice">hi-IN-Hemant</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__hi__female">
		<xsl:attribute name="voice">hi-IN-Kalpana-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__hi__female">
		<xsl:attribute name="voice">hi-IN-Kalpana</xsl:attribute>
	</xsl:attribute-set-->

	<!-- Voice speaking in Croat -->
	<xsl:attribute-set name="__voice__hr__male">
		<xsl:attribute name="voice">hr-HR-Matej</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Hungarian -->
	<xsl:attribute-set name="__voice__hu__male">
		<xsl:attribute name="voice">hu-HU-Szabolcs</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Bassa Indonesia -->
	<xsl:attribute-set name="__voice__id__male">
		<xsl:attribute name="voice">id-ID-Andika</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in Italian -->
	<xsl:attribute-set name="__voice__it__male">
		<xsl:attribute name="voice">it-IT-Cosimo-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__it__female">
		<xsl:attribute name="voice">it-IT-LuciaRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in Japanese -->
	<xsl:attribute-set name="__voice__ja__female">
		<xsl:attribute name="voice">ja-JP-Ayumi-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__ja__female">
		<xsl:attribute name="voice">ja-JP-HarukaRUS</xsl:attribute>
	</xsl:attribute-set-->
	<xsl:attribute-set name="__voice__ja__male">
		<xsl:attribute name="voice">ja-JP-Ichiro-Apollo</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Korean -->
	<xsl:attribute-set name="__voice__ko__female">
		<xsl:attribute name="voice">ko-KR-HeamiRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Malay -->
	<xsl:attribute-set name="__voice__ms__male">
		<xsl:attribute name="voice">ms-MY-Rizwan</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Norwegian bokmål -->
	<xsl:attribute-set name="__voice__nb__female">
		<xsl:attribute name="voice">nb-NO-HuldaRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__no__female">
		<xsl:attribute name="voice">nb-NO-HuldaRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Dutch -->
	<xsl:attribute-set name="__voice__nl__female">
		<xsl:attribute name="voice">nl-NL-HannaRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Polish -->
	<xsl:attribute-set name="__voice__pl__female">
		<xsl:attribute name="voice">pl-PL-PaulinaRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in Portuguese -->
	<xsl:attribute-set name="__voice__pt__female">
		<xsl:attribute name="voice">pt-BR-HeloisaRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__pt__male">
		<xsl:attribute name="voice">pt-BR-Daniel-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<!-- Voices speaking in Regional Portuguese -->
	<xsl:attribute-set name="__voice__pt-br__female">
		<xsl:attribute name="voice">pt-BR-HeloisaRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__pt-br__male">
		<xsl:attribute name="voice">pt-BR-Daniel-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__pt-pt__female">
		<xsl:attribute name="voice">pt-PT-HeliaRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Romanian -->
	<xsl:attribute-set name="__voice__ro__male">
		<xsl:attribute name="voice">ro-RO-Andrei</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voices speaking in Russian -->
	<xsl:attribute-set name="__voice__ru__female">
		<xsl:attribute name="voice">ru-RU-EkaterinaRUS</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__ru__female">
		<xsl:attribute name="voice">ru-RU-Irina-Apollo</xsl:attribute>
	</xsl:attribute-set-->
	<xsl:attribute-set name="__voice__ru__male">
		<xsl:attribute name="voice">ru-RU-Pavel-Apollo</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Slovak -->
	<xsl:attribute-set name="__voice__sk__male">
		<xsl:attribute name="voice">sk-SK-Filip</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Slovene -->
	<xsl:attribute-set name="__voice__sl__male">
		<xsl:attribute name="voice">sl-SI-Lado</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Swedish -->
	<xsl:attribute-set name="__voice__sv__female">
		<xsl:attribute name="voice">sv-SE-HedvigRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Tamil -->
	<xsl:attribute-set name="__voice__ta__male">
		<xsl:attribute name="voice">ta-IN-Valluvar</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Telugu -->
	<xsl:attribute-set name="__voice__te__female">
		<xsl:attribute name="voice">te-IN-Chitra</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Thai -->
	<xsl:attribute-set name="__voice__th__male">
		<xsl:attribute name="voice">th-TH-Pattara</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Turkish -->
	<xsl:attribute-set name="__voice__tr__female">
		<xsl:attribute name="voice">tr-TR-SedaRUS</xsl:attribute>
	</xsl:attribute-set>

	<!-- Voice speaking in Vietnamese -->
	<xsl:attribute-set name="__voice__vi__male">
		<xsl:attribute name="voice">vi-VN-An</xsl:attribute>
	</xsl:attribute-set>


	<!-- Voices speaking in Chinese -->
	<xsl:attribute-set name="__voice__zh__female">
		<xsl:attribute name="voice">zh-CN-HuihuiRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__zh__male">
		<xsl:attribute name="voice">zh-CN-Kangkang-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<!-- Voices speaking in Regional Chinese -->
	<xsl:attribute-set name="__voice__zh-cn__female">
		<xsl:attribute name="voice">zh-CN-HuihuiRUS</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__zh-cn__male">
		<xsl:attribute name="voice">zh-CN-Kangkang-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__zh-hk__female">
		<xsl:attribute name="voice">zh-HK-Tracy-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__zh-hk__female">
		<xsl:attribute name="voice">zh-HK-TracyRUS</xsl:attribute>
	</xsl:attribute-set-->
	<xsl:attribute-set name="__voice__zh-hk__male">
		<xsl:attribute name="voice">zh-HK-Danny-Apollo</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="__voice__zh-tw__female">
		<xsl:attribute name="voice">zh-TW-HanHanRUS</xsl:attribute>
	</xsl:attribute-set>
	<!--xsl:attribute-set name="__voice__zh-tw__female">
		<xsl:attribute name="voice">zh-TW-Yating-Apollo</xsl:attribute>
	</xsl:attribute-set-->
	<xsl:attribute-set name="__voice__zh-tw__male">
		<xsl:attribute name="voice">zh-TW-Zhiwei-Apollo</xsl:attribute>
	</xsl:attribute-set>

</xsl:stylesheet>
