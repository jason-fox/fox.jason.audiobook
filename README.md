# Audiobook for DITA-OT [<img src="https://jason-fox.github.io/fox.jason.audiobook/audiobook.png" align="right" width="300">](https://audiobookdita-ot.rtfd.io/)

[![license](https://img.shields.io/github/license/jason-fox/fox.jason.audiobook.svg)](http://www.apache.org/licenses/LICENSE-2.0)
[![DITA-OT 3.4](https://img.shields.io/badge/DITA--OT-3.4-blue.svg)](http://www.dita-ot.org/3.4)
[![Build Status](https://travis-ci.org/jason-fox/fox.jason.audiobook.svg?branch=master)](https://travis-ci.org/jason-fox/fox.jason.audiobook)
[![Coverage Status](https://coveralls.io/repos/github/jason-fox/fox.jason.audiobook/badge.svg?branch=master)](https://coveralls.io/github/jason-fox/fox.jason.audiobook?branch=master)
[![Documentation Status](https://readthedocs.org/projects/audiobookdita-ot/badge/?version=latest)](https://audiobookdita-ot.readthedocs.io/en/latest/?badge=latest)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=fox.jason.audiobook&metric=alert_status)](https://sonarcloud.io/dashboard?id=fox.jason.audiobook)


This [DITA-OT Plug-in](https://www.dita-ot.org/plugins) transforms DITA to speech in the form of an audiobook.

### DITA Topic

```xml
<task id="replacecover" xml:lang="en-us">
  <title>Replace the cover of your system.</title>
  <shortdesc>The cover needs to be put back on to reduce problems from dust.</shortdesc>
  <taskbody>
    <steps>
      <step>
        <cmd>Retrieve the computer's cover from its safe place. Put it back on.</cmd>
      </step>
      <step>
        <cmd>Retrieve the screws from the safe place. Put them back in.</cmd>
      </step>
      <step>
        <cmd>Put away your screwdriver before you lose it.</cmd>
      </step>
    </steps>
  </taskbody>
</task>
```

### MP3 Output File

<audio controls>
  <source src="https://jason-fox.github.io/fox.jason.audiobook/replacecover.mp3" type="audio/mpeg">
  <a href="https://jason-fox.github.io/fox.jason.audiobook/replacecover.mp3">
    <img src="https://jason-fox.github.io/fox.jason.audiobook/mp3.png"/>
  </a>
</audio>

:arrow_forward: [Video from DITA-OT Day 2019](https://youtu.be/icbLaNGdV8c)

[![](https://jason-fox.github.io/fox.jason.audiobook/cloud-video.png)](https://youtu.be/icbLaNGdV8c)

<details>
<summary><strong>Table of Contents</strong></summary>

-   [Install](#install)
    -   [Installing DITA-OT](#installing-dita-ot)
    -   [Installing the Plug-in](#installing-the-plug-in)
    -   [Installing the FFMpeg tool](#installing-the-ffmpeg-tool)
    -   [Signing up for a Text-to-Speech Service](#signing-up-for-a-text-to-speech-service)
        -   [IBM Cloud Services](#ibm-cloud-services)
        -   [Microsoft Azure](#microsoft-azure)
-   [Usage](#usage)
    -   [Invocation from the Command line](#invocation-from-the-command-line)
        -   [Obtaining a series of SSML Files](#obtaining-a-series-of-ssml-files)
        -   [Obtaining a series of MP3 Files](#obtaining-a-series-of-mp3-files)
        -   [Creating an audiobook](#creating-an-audiobook)
        -   [Parameter Reference](#parameter-reference)
    -   [Selecting a voice to use](#selecting-a-voice-to-use)
    -   [Marking up SSML tags.](#marking-up-ssml-tags)
-   [Contribute](#contribute)
-   [License](#license)

</details>

## Install

The audiobook plug-in has been tested against [DITA-OT 3.x](http://www.dita-ot.org/download). It is recommended that you
upgrade to the latest version.

### Installing DITA-OT

<a href="https://www.dita-ot.org"><img src="https://www.dita-ot.org/images/dita-ot-logo.svg" align="right" height="55"></a>

The DITA-OT Audiobook transform is a plug-in for the DITA Open Toolkit.

-   Full installation instructions for downloading DITA-OT can be found
    [here](https://www.dita-ot.org/3.4/topics/installing-client.html).

    1.  Download the `dita-ot-3.4.1.zip` package from the project website at
        [dita-ot.org/download](https://www.dita-ot.org/download)
    2.  Extract the contents of the package to the directory where you want to install DITA-OT.
    3.  **Optional**: Add the absolute path for the `bin` directory to the _PATH_ system variable.

    This defines the necessary environment variable to run the `dita` command from the command line.

```console
curl -LO https://github.com/dita-ot/dita-ot/releases/download/3.4.1/dita-ot-3.4.1.zip
unzip -q dita-ot-3.4.1.zip
rm dita-ot-3.4.1.zip
```

### Installing the Plug-in

-   Run the plug-in installation command:

```console
dita -install https://github.com/jason-fox/fox.jason.audiobook/archive/master.zip
```

The `dita` command line tool requires no additional configuration.

---

### Installing the FFMpeg tool

<a href="https://ffmpeg.org"><img src="https://tecadmin.net/wp-content/uploads/2013/11/ffmpeg-logo-370x250.png" align="right" height="80"></a>

FFmpeg is a free software project consisting of a software suite of libraries and programs for handling video, audio,
and other multimedia files and streams. FFmpeg is published under the GNU Lesser General Public License 2.1+ or GNU
General Public License 2+ (depending on which options are enabled).

To download a copy follow the instructions on the [Download page](https://ffmpeg.org/download.html)

---

### Signing up for a Text-to-Speech Service

Several publically available **text-to-speech** cloud services are available for use, they typically offer a
_try-before-you-buy_ option and generally offer sample access to the service for without cost. Upgrading to a paid
version will be necessary when transforming larger documents.

---

#### IBM Cloud Services

<a href="https://cloud.ibm.com/docs/services/text-to-speech?topic=text-to-speech-gettingStarted"><img src="https://www.nasuni.com/wp-content/uploads/2017/06/ibm-cloud.png" align="right" height="85"></a>

The IBM Text to Speech service processes text and natural language to generate synthesized audio output complete with
appropriate cadence and intonation. It is available in several voices:

Introduction: [Getting Started](https://cloud.ibm.com/docs/services/text-to-speech?topic=text-to-speech-gettingStarted)

Create an instance of the service:

1.  Go to the [Text to Speech](https://cloud.ibm.com/catalog/services/text-to-speech) External link icon page in the IBM
    Cloud Catalog.
2.  Sign up for a free IBM Cloud account or log in.
3.  Click Create.

Copy the credentials to authenticate to your service instance:

1.  From the [IBM Cloud dashboard](https://cloud.ibm.com/dashboard/apps) External link icon, click on your **Text to
    Speech** service instance to go to the **Text to Speech** service dashboard page.
2.  On the Manage page, click Show to view your credentials.
3.  Copy the `API Key` and `URL` values.
4.  Within the plug-in alter the file `cfg/configuration.properties` to hold your `API Key` and `URL`.

---

#### Microsoft Azure

<a href="https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/get-started"><img src="https://www.confluent.io/wp-content/uploads/MS-Azure_logo_stacked_c-gray_rgb.png" align="right" height="85"></a>

The Speech Services allow you to convert text into synthesized speech and get a list of supported voices for a region
using a set of REST APIs. Each available endpoint is associated with a region. A subscription key for the
endpoint/region you plan to use is required.

Introduction: [Getting Started](https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/get-started)

Create an instance of the service:

1.  Go to Try [Cognitive Services](https://azure.microsoft.com/try/cognitive-services/)
2.  Select the Speech APIs tab.
3.  Under Speech Services, select the Get API Key button.
4.  Agree to the terms and select your locale from the drop-down menu.
5.  Sign in by using your Microsoft, Facebook, LinkedIn, or GitHub account.

You can sign up for a free Microsoft account at the Microsoft account portal. To get started, click Sign in with
Microsoft and then, when asked to sign in, click Create one. Follow the steps to create and verify your new Microsoft
account.

After you sign in to Try Cognitive Services, your free trial begins. The displayed webpage lists all the Azure Cognitive
Services services for which you currently have trial subscriptions. Two subscription keys are listed beside Speech
Services. You can use either key in your applications.

Copy the credentials to authenticate to your service instance:

1.  Copy either of the `API Key` and `Endpoint` values.
2.  Within the plug-in alter the file `cfg/configuration.properties` to hold your `API Key` and `URL`.

---

## Usage

### Invocation from the Command line

#### Obtaining a series of SSML Files

To run, use the `ssml` transform.

```console
PATH_TO_DITA_OT/bin/dita -f ssml  -o out -i PATH_TO_DITAMAP
```

Once the command has run, a `list.txt` and a series of `*.ssml` files will be available in the output directory.

#### Obtaining a series of MP3 Files

To run, use the `mp3` transform.

```console
PATH_TO_DITA_OT/bin/dita -f mp3  -o out -i PATH_TO_DITAMAP --ssml.service=[bing|watson]
```

Once the command has run, a `list.txt` and a series of `*.mp3` files will be available in the output directory.

#### Creating an audiobook

To run, use the `audiobook` transform.

```console
PATH_TO_DITA_OT/bin/dita -f audiobook  -o out -i PATH_TO_DITAMAP --ssml.service=[bing|watson]
```

Once the command has run, an `*.m4a` file will be created in the output directory.

### Parameter Reference

-   `ssml.service` - Decides which translation service to use:
    -   `dummy` - Avoids accessing a Speech-to-Text service, uses a dummy MP3 file for all outputs
    -   `custom` - Sends the SSML to an arbitrary URL using POST - use this to connect to proxies for Amazon
        [Polly](https://docs.aws.amazon.com/polly/) or Google Cloud
        [Text-to-Speech](https://cloud.google.com/text-to-speech/)
    -   `watson` - Connects to the IBM Cloud Speech-to-Text service
    -   `bing` - Connects to the Microsoft Speech-to-Text service
-   `ssml.gender` - Prefered Voice Gender:
    -   `male` - Use a male voice for text-to-speech where available.
    -   `female` - Use a female voice for text-to-speech where available.
-   `ssml.authentication.url` - URL for creating an OAuth token if needed for a service. Defaults to the value in
    `configuration.properties`
-   `ssml.output.format` - Output format override for a Speech-to-Text service. Defaults to the value in
    `configuration.properties`
-   `ssml.apikey` - API Key for the Speech-to-Text service. Defaults to the value in `configuration.properties`
-   `ssml.url` - URL for a Speech-to-Text service. Defaults to the value in `configuration.properties`
-   `mp3.cachefile` - Specifies the location of a cache file to be used. If the SSML file matches to a previously
    generated mp3 file in the cache the mp3 file will be copied over and the Speech-to-Text service will not be called.
-   `mp3.cover.art.add` - Specifies whether or not cover art is to be added to an album (default `no`)
-   `mp3.cover.art.image` - Specifies the cover art to be used for an album, the default will use the image
    plug-in alter the file `cfg/cover-art.png`
-   `audiobook.format` - mp4 Output Format (with or without DRM)
    -   `m4a` - audio file created in the MPEG-4 format (default)
    -   `m4b` - audio file created in the MPEG-4 format with DRM

### Selecting a voice to use

When running the `mp3` or `audiobook` transforms, the _male voice_ corresponding to the `xml:lang` attribute of the
root topic will be chosen to render the speech. Use the `--ssml.gender=female` parameter to switch to the _female voice_. If
no voice of the preferred gender can be found, the default will be used.

A list of available voices can be found within following files:

-   `cfg/attrs/bing.voice-attr.xsl`
-   `cfg/attrs/watson.voice-attr.xsl`

Each listing shows the default male and female voices for a language, plus any regional variants which are available:

```xml
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
    <xsl:attribute name="voice">en-US_LisaVoice</xsl:attribute>
</xsl:attribute-set-->
<xsl:attribute-set name="__voice__en-gb__female">
    <xsl:attribute name="voice">en-GB_KateVoice</xsl:attribute>
</xsl:attribute-set>
```

As you can see the `en-US_AllisonVoice` is currently the preferred female voice for all documents marked up as
`xml:lang="en"` and `xml:lang="en-US"`.

-   to alter the `en` preferences, replace the text within the `<xsl:attribute name="voice">` element with the preferred
    voice.
-   to alter the `en-us` preferences, comment out the existing selection and uncomment the new preferred voice.

### Marking up SSML tags.

Some DITA tags such as `<p>` and `<b>` translate directly to SSML, however there is rich vocabulary of audio effects
which are missing from the vanilla DITA specification. These can be accommodated using the `props` attribute added to
`<ph>` tag. Examples are given below. The listing is mainly based on the
[IBM Text to Speech Programming Guide](https://www.ibm.com/support/knowledgecenter/SSMQSV_6.1.1/com.ibm.voicetools.ssml.doc/tts_ssml.pdf),
however the DITA plug-in is not service specific so some additional tags can be used. Obviously common substitutions
should be replaced with `<keyword>` elements for consistency of reuse.

**Note**: Not all tags and attributes will be supported by every provider.

#### `<say-as>` Element

The `say-as` tag allows the author to indicate information on the type of text contained within the tag and to help
specify the level of detail for rendering the text. The required attribute for this tag is `interpret-as` . There are
two optional attributes, `format` and `detail`, which are only used with particular values within the `interpret-as`
attribute. These optional attributes are illustrated within the entries for their associated values.

-   `letters`: This value spells out the characters in a given word within the enclosed tag.

##### Example (This will spell out _"HELLO"_):

```xml
<ph props="say-as interpret-as(letters)">Hello</ph>
```

-   `digits`: This value spells out the digits in a given number within the enclosed tag.

##### Example (This will spell out _"123456"_):

```xml
<ph props="say-as interpret-as(digits)">123456</ph>
```

-   `vxml:digits`: This value performs the same function as the digits value.

##### Example

```xml
<ph props="say-as interpret-as(vxml:digits)">123456</ph>
```

-   `date` This value will speak the date within the enclosed tag, using the format given in the associated `format`
    attribute. The `format` attribute is required for use with the date value of `interpret-as`, but if `format` is not
    present, the engine will still attempt to pronounce the date.

##### Example (This gives a list of dates in all the various formats: )

```xml
<ph props="say-as interpret-as(date) format(mdy)">12/17/2005</ph>
<ph props="say-as interpret-as(date) format(ymd)">2005/12/17</ph>
<ph props="say-as interpret-as(date) format(dmy)">17/12/2005</ph>
<ph props="say-as interpret-as(date) format(ydm)">2005/17/12</ph>
<ph props="say-as interpret-as(date) format(my)">12/2005</ph>
<ph props="say-as interpret-as(date) format(md)">12/17</ph>
<ph props="say-as interpret-as(date) format(ym)">2005/12</ph>
```

-   `ordinal` - This value will speak the ordinal value for the given digit within the enclosed tag.

##### Example (This will say _"second first"_):

```xml
<ph props="say-as interpret-as(ordinal)">2</ph>
<ph props="say-as interpret-as(ordinal)">1</ph>
```

-   `cardinal` - This value will speak the cardinal number corresponding to the Roman numeral within the enclosed tag.

##### Example (This will say _"Super Bowl thirty-nine"_):

```xml
Super Bowl <ph props="say-as interpret-as(cardinal)">XXXIX</ph>
```

-   `number` - This value is an alternative to using the values given above. Using the `format` attribute to determine
    how the number is to be interpreted, you can enter one series of number and have it pronounced several different
    ways, as in the example. The example also includes two different ways of pronouncing a series of numbers as a
    telephone number. To have the series pronounced with the punctuation included, you must add the `detail` attribute.

##### Examples

```xml
<ph props="say-as interpret-as(number)">123456</ph>
<ph props="say-as interpret-as(number) format(ordinal)">123456</ph>
<ph props="say-as interpret-as(number) format(cardinal)">123456</ph>
<ph props="say-as interpret-as(number) format(telephone)">555-555-5555</ph>
<ph props="say-as interpret-as(number) format(telephone) detail(punctuation)">555-555-5555</ph>
```

-   `vxml:boolean` - This value will speak `yes` or `no` depending on the value given within the enclosed tag.

##### Examples

```xml
<ph props="say-as interpret-as(vxml:boolean)">true</ph>
<ph props="say-as interpret-as(vxml:boolean)">false</ph>
```

-   `vxml:date` - This value works like the date value, except that the format is predefined as `YYYYMMDD`. When a value
    is not known, or you do not wish it to be displayed, a question mark is used to replace that value, as shown in the
    example.

##### Examples

```xml
<ph props="say-as interpret-as(vxml:date)">20050720</ph>
<ph props="say-as interpret-as(vxml:date)">????0720</ph>
<ph props="say-as interpret-as(vxml:date)">200507??</ph>
```

-   `vxml:currency` - This value is used to control the synthesis of monetary quantities. The string must be written in
    the `UUUmm.nn` format, where `UUU` is the three character currency indicator specified by ISO standard 4217, and
    `mm.nn` is the amount.

##### Example (This will say _"forty-five dollars and thirty cents"_):

```xml
<ph props="say-as interpret-as(vxml:currency)">USD45.30</ph>
```

If there are more than two decimal places in the number within the enclosed tag, the amount will be synthesized as a
decimal number followed by the currency indicator. If the three character currency indicator is not present, the number
will be synthesized as a decimal only, with no pronunciation of currency type.

##### Example (This will say _"forty-five point three two nine US dollars"_):

```xml
<ph props="say-as interpret-as(vxml:currency)">USD45.329</ph>
```

-   `vxml:phone` - This value will speak a phone number with both digits and punctuation, similar to the `number` value
    used with `format(telephone)`.

```xml
<ph props="say-as interpret-as(vxml:phone)">555-555-5555</ph>
```

#### `<phoneme>` Element

The SSML phoneme tag enables users to provide a phonetic pronunciation for the enclosed text. This tag has two
attributes:

-   `alphabet` - This attribute specifies the phonology used. The supported alphabets to designate are `ipa` for the
    International Phonetic Alphabet, and `ibm` for the SPR representation.

-   `ph` - This attribute specifies the pronunciation. It is a required attribute. This example shows how a
    pronunciation for _"tomato"_ is specified using the IPA phonology, where the symbols are given using Unicode:

##### Examples

```xml
<ph props="phoneme alphabet(ipa) ph(t&#x259;mei&#x27E;ou&#x325;)">tomato</ph>
```

This example shows how a pronunciation for _"tomato"_ is specified using the SPR phonology:

```xml
<ph props="phoneme alphabet(ibm) ph(.0tx.1me.0fo)">tomato</ph>
```

#### `<sub>` Element

This tag is used to indicate that the text included in the alias attribute is to replace the text enclosed within the
tag when speech is synthesized. The only attribute for this tag is the `alias` attribute, and it is required.

##### Example

```xml
<ph props="sub alias(International Business Machines)">IBM</ph>
```

#### `<voice>` Element

This tag is used when a change in voice is required. Although all attributes listed are optional, without any attributes
defined an error will result. The optional attributes are:

-   `age` Accepted values are positive integers between the ages of 14 and 60 for both male and female.
-   `gender` Accepted values are `male` and `female`.
-   `name` Accepted values are the installed voices’ names.
-   `variant` Accepted values are positive integers.

##### Examples

```xml
<ph props="voice age(60)">Sixty year-old's voice.</ph>
<ph props="voice gender(female)">This is a female voice.</ph>
<ph props="voice name(Allison)">Use the IBM TTS voice named Allison.</ph>
<ph props="voice name(Allison, Andrew, Tyler)">Use the first available IBM TTS voice named in the given list.</ph>
```

#### `<emphasis>` Element

The `<emphasis>` element equests that the contained text be spoken with emphasis (also referred to as prominence or
stress).

-   `level`: the optional level attribute indicates the strength of emphasis to be applied. Defined values are `strong`,
    `moderate`, `none` and `reduced`. The default level is `moderate`. The meaning of `strong` and `moderate` emphasis
    is interpreted according to the language being spoken (languages indicate emphasis using a possible combination of
    pitch change, timing changes, loudness and other acoustic differences). The `reduced` level is effectively the
    opposite of emphasizing a word. For example, when the phrase "going to" is reduced it may be spoken as "gonna". The
    `none` level is used to prevent the synthesis processor from emphasizing words that it might typically emphasize.

##### Examples

```xml
That is a <ph props="emphasis"> big </ph> car!
That is a <ph props="emphasis level(strong)"> huge </ph>bank account!
```

Emphasis can also be achieved using the `<b>` tag

```xml
That is a <b> big </b> car!
That is a <b props="level(strong)"> huge </b>bank account!
```

#### `<break>` Element

This tag inserts pauses into the spoken text. It has the following optional attributes:

-   `strength` - This attribute specifies the length of a pause in terms of varying strength values: `none,` `x-weak,`
    `weak,` `medium,` `strong,` or `x-strong.`
-   `time` - This attribute specifies the length of the pause in terms of seconds or milliseconds. The values formats
    are `NNNs` for seconds or `NNNms` for milliseconds.

##### Examples

```xml
Different sized <ph props="break strength(none)"/> pauses.
Different sized <ph props="break strength(x-weak)"/> pauses.
Different sized <ph props="break strength(weak)"/> pauses.
Different sized <ph props="break strength(medium)"/> pauses.
Different sized <ph props="break strength(strong)"/> pauses.
Different sized <ph props="break strength(x-strong)"/> pauses.
Different sized <ph props="break time(1s)"/> pauses.
Different sized <ph props="break time(1000ms)"/> pauses.
```

#### `<prosody>` Element

This tag controls the pitch, range, speaking rate, and volume of the text. all attributes are optional, but if no
attribute is given an error results.

Here is a description of the optional attributes:

-   `pitch` - This attribute modifies the baseline pitch for the text enclosed within the tag. Accepted values are
    either:, a number followed by the Hz designation, a relative change, `x-low`, `low`, `medium`, `high`, `x-high`,
    `default`

-   `range` This attribute modifies the pitch range for the text enclosed within the tag. Accepted values for this
    attribute are the same as the accepted values for `pitch`.
-   `rate` - This attribute indicates a change in the speaking rate for contained text. Accepted values are: - a
    relative change - a positive number, `x-slow`, `slow`, `medium`, `fast`, `x-fast`, `default`

The `rate` is specified in terms of words-per-minute. If the speaking rate is 50 words per minute, then `rate=50`. If
the setting is `rate=+10`, the speaking rate will be 10 words per minute faster than your current `rate` setting.

-   volume - This attribute modifies the volume for the contained text. The range for values is `0.0` to `100.0` or the
    relative values of : `silent`, `x-soft`, `soft`, `medium`, `loud`, `x-loud`, `default`

##### Examples

```xml
<ph props="prosody pitch(150Hz)"> Modified pitch </ph>
<ph props="prosody pitch(-20Hz)"> Modified pitch </ph>
<ph props="prosody pitch(+20Hz)"> Modified pitch </ph>
<ph props="prosody pitch(-12st)"> Modified pitch </ph>
<ph props="prosody pitch(+12st)"> Modified pitch </ph>
<ph props="prosody pitch(x-low)"> Modified pitch </ph>
<ph props="prosody range(150Hz)"> Modified pitch range</ph>
<ph props="prosody range(-20Hz)"> Modified pitch range</ph>
<ph props="prosody range(+20Hz)"> Modified pitch range</ph>
<ph props="prosody range(-12st)"> Modified pitch range</ph>
<ph props="prosody range(+12st)"> Modified pitch range</ph>
<ph props="prosody range(x-high)"> Modified pitch range</ph>
<ph props="prosody rate(slow)"> Modified speaking rate</ph>
<ph props="prosody rate(+25)"> Modified speaking rate</ph>
<ph props="prosody rate(-25)"> Modified speaking rate</ph>
<ph props="prosody volume(88.9)">Modified volume</ph>
<ph props="prosody volume(loud)">Modified volume</ph>
```

#### `<audio>` Element

This tag inserts recorded elements into the generated audio. The only attribute is `src` and is required. This attribute
specifies the location of the file to be inserted.

##### Example

```xml
<ph props="audio src(http://www.myfiles.com/files/beep.wav)"/>
```

## Contribute

PRs accepted.

## License

[Apache 2.0](LICENSE) © 2019 Jason Fox
