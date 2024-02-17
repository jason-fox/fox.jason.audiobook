<?xml version="1.0" encoding="UTF-8"?>
<!--
  This file is part of the DITA-OT Audiobook Plug-in project.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:param name="SOURCE" select="'document.ditamap'"/>
  <xsl:param name="OUTEXT" select="'.ssml'"/>

  <xsl:variable name="mainbooktitle">
  	<xsl:value-of select="document($SOURCE)//bookmap/booktitle/mainbooktitle/text()"/>
  </xsl:variable>
  <xsl:variable name="booktitle">
  	<xsl:value-of select="document($SOURCE)//bookmap/title/text()"/>
  </xsl:variable>
  <xsl:variable name="bookrights">
  	<xsl:value-of select="document($SOURCE)//bookmap/bookmeta/bookrights"/>
  </xsl:variable>

  <!-- Get each value in each <keywords>. Nested indexterms should have unique entries. Other
       elements (based on keyword) cannot nest. -->
  <xsl:key name="meta-keywords" match="*[ancestor::*[contains(@class,' topic/keywords ')]]" use="text()[1]"/>
  
  <xsl:template name="getMeta">
  
    <!-- Processing note:
     getMeta is issued from the topic/topic context, therefore it is looking DOWN
     for most data except for attributes on topic, which will be current context.
    -->
  
    <!-- = = = = = = = = = = = CONTENT = = = = = = = = = = = -->
  
    <!-- CONTENT: Type -->
    <xsl:apply-templates select="." mode="gen-type-metadata"/>
  
    <!-- CONTENT: Title - title -->
    <xsl:apply-templates
      select="*[contains(@class,' topic/title ')] |
                                 self::dita/*[1]/*[contains(@class,' topic/title ')]"
      mode="gen-metadata"
    />
  
    <!-- CONTENT: Description - shortdesc -->
    <xsl:apply-templates
      select="*[contains(@class,' topic/shortdesc ')] |
                                 self::dita/*[1]/*[contains(@class,' topic/shortdesc ')]"
      mode="gen-metadata"
    />
    <xsl:apply-templates
      select="*[contains(@class,' topic/abstract ')] |
                                 self::dita/*[1]/*[contains(@class,' topic/abstract ')]"
      mode="gen-shortdesc-metadata"
    />
 
  
    <!-- CONTENT: Coverage prolog/metadata/category -->
    <xsl:apply-templates
      select="*[contains(@class,' topic/prolog ')]/*[contains(@class,' topic/metadata ')]/*[contains(@class,' topic/category ')] |
                                 self::dita/*[1]/*[contains(@class,' topic/prolog ')]/*[contains(@class,' topic/metadata ')]/*[contains(@class,' topic/category ')]"
      mode="gen-metadata"
    />
  
    <!-- CONTENT: Subject - prolog/metadata/keywords -->
    <xsl:apply-templates select="." mode="gen-keywords-metadata"/>
  
  

  
 

  
    <!-- = = = = = = = = = = = INTELLECTUAL PROPERTY = = = = = = = = = = = -->
  
    <!-- INTELLECTUAL PROPERTY: Contributor - prolog/author -->
    <!-- INTELLECTUAL PROPERTY: Creator -->
    <xsl:apply-templates
      select="*[contains(@class,' topic/prolog ')]/*[contains(@class,' topic/author ')] |
                                 self::dita/*[1]/*[contains(@class,' topic/prolog ')]/*[contains(@class,' topic/author ')]"
      mode="gen-metadata"
    />
  
    <!-- INTELLECTUAL PROPERTY: Publisher - prolog/publisher -->
    <xsl:apply-templates
      select="*[contains(@class,' topic/prolog ')]/*[contains(@class,' topic/publisher ')] |
                                 self::dita/*[1]/*[contains(@class,' topic/prolog ')]/*[contains(@class,' topic/publisher ')]"
      mode="gen-metadata"
    />
  
    <!-- INTELLECTUAL PROPERTY: Rights - prolog/copyright -->
    <!-- Put primary first, then secondary, then remainder -->
    <xsl:apply-templates
      select="*[contains(@class,' topic/prolog ')]/*[contains(@class,' topic/copyright ')][@type='primary'] |
                                 self::dita/*[1]/*[contains(@class,' topic/prolog ')]/*[contains(@class,' topic/copyright ')][@type='primary']"
      mode="gen-metadata"
    />

    <xsl:apply-templates
      select="*[contains(@class,' topic/prolog ')]/*[contains(@class,' topic/copyright ')][@type='secondary'] |
                                 self::dita/*[1]/*[contains(@class,' topic/prolog ')]/*[contains(@class,' topic/copyright ')][@type='seconday']"
      mode="gen-metadata"
    />

    <xsl:apply-templates
      select="*[contains(@class,' topic/prolog ')]/*[contains(@class,' topic/copyright ')][not(@type)] |
                                 self::dita/*[1]/*[contains(@class,' topic/prolog ')]/*[contains(@class,' topic/copyright ')][not(@type)]"
      mode="gen-metadata"
    />
  
  
    <!-- = = = = = = = = = = = INSTANTIATION = = = = = = = = = = = -->
  
  
    <!-- prolog/metadata/othermeta -->
    <xsl:apply-templates
      select="*[contains(@class,' topic/prolog ')]/*[contains(@class,' topic/metadata ')]/*[contains(@class,' topic/othermeta ')] |
                                 self::dita/*[1]/*[contains(@class,' topic/prolog ')]/*[contains(@class,' topic/metadata ')]/*[contains(@class,' topic/othermeta ')]"
      mode="gen-metadata"
    />
  
    <!-- INSTANTIATION: Format -->
    <xsl:apply-templates select="." mode="gen-format-metadata"/>
  
    <!-- INSTANTIATION: Identifier --> <!-- id is an attribute on Topic -->
    <xsl:apply-templates select="@id | self::dita/*[1]/@id" mode="gen-metadata"/>
  
    <!-- INSTANTIATION: Language -->
    <xsl:apply-templates select="@xml:lang | self::dita/*[1]/@xml:lang" mode="gen-metadata"/>
  
  </xsl:template>
  
  
  <!-- CONTENT: Type -->
  <xsl:template match="dita" mode="gen-type-metadata">
    <xsl:apply-templates select="*[1]" mode="gen-type-metadata"/>
  </xsl:template>
  <xsl:template match="*" mode="gen-type-metadata">
    <meta name="DC.type" content="{name(.)}"/>
    <xsl:if test="not(@xml:lang)">
    	<xsl:element name="meta">
	        <xsl:attribute name="name">
	          <xsl:text>DC.language</xsl:text>
	        </xsl:attribute>
	    	<xsl:attribute name="content">
	          <xsl:call-template name="getLowerCaseLang"/>
	        </xsl:attribute>
    	</xsl:element>
    </xsl:if>

     <xsl:if test="not(prolog/copyright) and $bookrights">
			<meta name="rights">
			  <xsl:attribute name="content">
			    <xsl:text>&#xA9; </xsl:text>
						<xsl:value-of select="document($SOURCE)//bookmap/bookmeta/bookrights/copyrfirst/year/text()"/>
						<xsl:if test="document($SOURCE)//bookmap/bookmeta/bookrights/copyrlast/year">
							 <xsl:text>-</xsl:text>
							<xsl:value-of select="document($SOURCE)//bookmap/bookmeta/bookrights/copyrlast/year/text()"/>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:value-of select="document($SOURCE)//bookmap/bookmeta/bookrights/bookowner/person/text()"/>
						<xsl:value-of select="document($SOURCE)//bookmap/bookmeta/bookrights/bookowner/organization/text()"/>         
			    </xsl:attribute>
			  </meta>
  	</xsl:if>


    <xsl:element name="meta">
			<xsl:attribute name="name">
				<xsl:text>DC.isPartOf</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="content">
	    	<xsl:value-of select="$mainbooktitle"/>
				<xsl:value-of select="$booktitle"/>
			</xsl:attribute>
		</xsl:element>
  </xsl:template>
  
  <xsl:template match="*[contains(@class,' topic/abstract ')]" mode="gen-shortdesc-metadata">
    <xsl:variable name="shortmeta">
      <xsl:for-each select="*[contains(@class,' topic/shortdesc ')]">
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="*|text()" mode="text-only"/>
      </xsl:for-each>
    </xsl:variable>
    <xsl:if test="normalize-space($shortmeta)!=''">
      <meta name="abstract">
        <xsl:attribute name="content"><xsl:value-of select="normalize-space($shortmeta)"/></xsl:attribute>
      </meta>
      <meta name="description">
        <xsl:attribute name="content"><xsl:value-of select="normalize-space($shortmeta)"/></xsl:attribute>
      </meta>
    </xsl:if>
  </xsl:template>



  <xsl:template match="*[contains(@class,' topic/title ')]" mode="gen-metadata">
    <meta name="DC.title" content="{normalize-space(.)}"/>
  </xsl:template>



  <xsl:template match="*[contains(@class,' topic/shortdesc ')]" mode="gen-metadata">
    <xsl:variable name="shortmeta">
      <xsl:apply-templates select="*|text()" mode="text-only"/>
    </xsl:variable>
    <meta name="description">
      <xsl:attribute name="content">
        <xsl:value-of select="normalize-space($shortmeta)"/>
      </xsl:attribute>
    </meta>
  </xsl:template>

  
  
  <!-- CONTENT: Coverage prolog/metadata/category -->
  <xsl:template
    match="*[contains(@class,' topic/metadata ')]/*[contains(@class,' topic/category ')]"
    mode="gen-metadata"
  >
    <meta name="DC.coverage" content="{normalize-space(.)}"/>
  </xsl:template>
  
  <!-- CONTENT: Subject - prolog/metadata/keywords -->
  <xsl:template match="*" mode="gen-keywords-metadata">
    <xsl:variable name="keywords-content">
      <!-- for each item inside keywords (including nested index terms) -->
      <xsl:for-each
        select="descendant::*[contains(@class,' topic/prolog ')]/*[contains(@class,' topic/metadata ')]/*[contains(@class,' topic/keywords ')]/descendant-or-self::*"
      >
        <!-- If this is the first term or keyword with this value -->
        <xsl:if test="generate-id(key('meta-keywords',text()[1])[1])=generate-id(.)">
          <xsl:if test="position()>2"><xsl:text>, </xsl:text></xsl:if>
          <xsl:value-of select="normalize-space(text()[1])"/>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
  
    <xsl:if test="string-length($keywords-content)>0">
      <meta name="DC.subject" content="{$keywords-content}"/>
      <meta name="keywords" content="{$keywords-content}"/>
    </xsl:if>
  </xsl:template>
  
  
  <!-- INTELLECTUAL PROPERTY: Contributor - prolog/author -->
  <!-- INTELLECTUAL PROPERTY: Creator -->
  <!-- Default is type='creator' -->
  <xsl:template match="*[contains(@class,' topic/author ')]" mode="gen-metadata">
    <xsl:choose>
      <xsl:when test="@type= 'contributor'">
        <meta name="DC.contributor" content="{normalize-space(.)}"/>
      </xsl:when>
      <xsl:otherwise>
        <meta name="DC.creator" content="{normalize-space(.)}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <!-- INTELLECTUAL PROPERTY: Publisher - prolog/publisher -->
  <xsl:template match="*[contains(@class,' topic/publisher ')]" mode="gen-metadata">

    <xsl:variable name="text">
      <xsl:for-each select="*">
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:text> </xsl:text>
      </xsl:for-each>
    </xsl:variable>

    <meta name="DC.publisher" content="{normalize-space($text)}"/>
  </xsl:template>
  
  <!--  Rights - prolog/copyright -->
  <xsl:template match="*[contains(@class,' topic/copyright ')]" mode="gen-metadata">
    <meta name="rights">
      <xsl:attribute name="content">
        <xsl:text>&#xA9; </xsl:text>
        <xsl:apply-templates select="*[contains(@class,' topic/copyryear ')][1]" mode="gen-metadata"/>
        <xsl:text> </xsl:text>
        <xsl:if test="*[contains(@class,' topic/copyrholder ')]">
          <xsl:value-of select="*[contains(@class,' topic/copyrholder ')]"/>
        </xsl:if>                
      </xsl:attribute>
    </meta>
  </xsl:template>
  
  <xsl:template match="*[contains(@class,' topic/copyryear ')]" mode="gen-metadata">
    <xsl:param name="previous" select="()"/>
    <xsl:param name="open-sequence" select="false()"/>
    <xsl:variable name="next" select="following-sibling::*[contains(@class,' topic/copyryear ')][1]"/>
    <xsl:variable name="begin-sequence" select="@year + 1 = number($next/@year)"/>
    <xsl:choose>
      <xsl:when test="$begin-sequence">
        <xsl:if test="not($open-sequence)">
          <xsl:value-of select="@year"/>
          <xsl:text>&#x2013;</xsl:text>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$next">
        <xsl:value-of select="@year"/>
        <xsl:text>, </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@year"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates select="$next" mode="gen-metadata">
      <xsl:with-param name="previous" select="."/>
      <xsl:with-param name="open-sequence" select="$begin-sequence"/>
    </xsl:apply-templates>
  </xsl:template>
  

  <!-- prolog/metadata/othermeta -->
  <xsl:template match="*[contains(@class,' topic/othermeta ')]" mode="gen-metadata">
    <meta name="{@name}" content="{@content}"/>
  </xsl:template>
  
  <!-- INSTANTIATION: Format -->
  <!-- this value is based on output format used for DC indexing, not source.
       Put in this odd template for easy overriding, if creating another output format. -->
  <xsl:template match="*" mode="gen-format-metadata">
    <meta name="DC.format" content="SSML"/>
  </xsl:template>
  
  <!-- INSTANTIATION: Identifier --> <!-- id is an attribute on Topic -->
  <xsl:template match="@id" mode="gen-metadata">
    <meta name="DC.identifier" content="{.}"/>
  </xsl:template>
  
  <!-- INSTANTIATION: Language -->
  <!-- ideally, take the first token of the language attribute value -->
  <xsl:template match="@xml:lang" mode="gen-metadata">
    <meta name="DC.language" content="{.}"/>
  </xsl:template>

</xsl:stylesheet>
