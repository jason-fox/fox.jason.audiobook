# Audiobook for DITA-OT

[![license](https://img.shields.io/github/license/jason-fox/fox.jason.audiobook.svg)](http://www.apache.org/licenses/LICENSE-2.0)
[![DITA-OT 3.3](https://img.shields.io/badge/DITA--OT-3.3-blue.svg)](http://www.dita-ot.org/3.3/) <br/>

This DITA-OT plug-in transforms DITA to speech in the form of an audiobook.

# Table of Contents

- [Install](#install)
  - [Installing DITA-OT](#installing-dita-ot)
  - [Installing the Plug-in](#installing-the-plug-in)
- [Usage](#usage)
- [Contribute](#contribute)
- [License](#license)

# Install

The audiobook plug-in has been tested against [DITA-OT 3.x](http://www.dita-ot.org/download). It is recommended that you upgrade to the latest version.

## Installing DITA-OT

The DITA-OT Audiobook transform is a plug-in for the DITA Open Toolkit.

- Full installation instructions for downloading DITA-OT can be found
  [here](https://www.dita-ot.org/3.3/topics/installing-client.html).

    1.  Download the `dita-ot-3.3.zip` package from the project website at [dita-ot.org/download](https://www.dita-ot.org/download)
    2.  Extract the contents of the package to the directory where you want to install DITA-OT.
    3.  **Optional**: Add the absolute path for the `bin` directory to the _PATH_ system variable.

  This defines the necessary environment variable to run the `dita` command from the command line.

```console
curl -LO https://github.com/dita-ot/dita-ot/releases/download/3.3/dita-ot-3.3.zip
unzip -q dita-ot-3.3.zip
rm dita-ot-3.3.zip
```

## Installing the Plug-in

- Run the plug-in installation command:

```console
dita -install https://github.com/jason-fox/fox.jason.audiobook/archive/master.zip
```

The `dita` command line tool requires no additional configuration.

## Installing the FFMpeg tool

FFmpeg is a free software project consisting of a software suite of libraries and programs for handling video,
audio, and other multimedia files and streams. FFmpeg is published under the GNU Lesser General Public License 2.1+
or GNU General Public License 2+ (depending on which options are enabled). 

To download a copy follow the instructions on the [Download page](https://ffmpeg.org/download.html)

## Signing up for a Text-to-Speech Service

Several publically available **text-to-speech** cloud services are available for use, they typically 
offer a _try-before-you-buy_ option and generally offer sample access to the service for without cost. 
Upgrading to a paid version will be necessary when transforming larger documents.

###  Text-to-Speech using IBM Cloud Services

The IBM Text to Speech service processes text and natural language to generate synthesized audio output complete
with appropriate cadence and intonation. It is available in several voices:

[Getting Started](https://cloud.ibm.com/docs/services/text-to-speech?topic=text-to-speech-gettingStarted)

Create an instance of the service:
1.  Go to the [Text to Speech](https://cloud.ibm.com/catalog/services/text-to-speech) External link icon page 
    in the IBM Cloud Catalog.
2.  Sign up for a free IBM Cloud account or log in.
3.  Click Create.

Copy the credentials to authenticate to your service instance:
1.  From the [IBM Cloud dashboard](https://cloud.ibm.com/dashboard/apps) External link icon, click on your
    **Text to Speech** service instance to go to the **Text to Speech** service dashboard page.
2.  On the Manage page, click Show to view your credentials.
3.  Copy the `API Key` and `URL` values.
4. Within the plug-in alter the file `cfg/watson.properties` to hold your `API Key` and `URL`.

# Usage

## Invocation from the Command line


### Obtaining a series of SSML Files

To run, use the `ssml` transform.

```console
PATH_TO_DITA_OT/bin/dita -f ssml  -o out -i PATH_TO_DITAMAP
```

Once the command has run, a `list.txt` and a series of `*.ssml` files will be available in the output directory. 

### Obtaining a series of MP3 Files

To run, use the `mp3` transform.

```console
PATH_TO_DITA_OT/bin/dita -f mp3  -o out -i PATH_TO_DITAMAP
```

Once the command has run, a `list.txt` and a series of `*.mp3` files will be available in the output directory. 

### Creating an audiobook

To run, use the `audiobook` transform.

```console
PATH_TO_DITA_OT/bin/dita -f audiobook  -o out -i PATH_TO_DITAMAP
```

Once the command has run, an `*.m4b` file will be created in the output directory. 

### Parameter Reference

-   `audiobook.service` - Decides which translation service to use:
    -  `dummy` - Avoids accessing a Speech-to-Text service, uses a dummy MP3 file for all outputs
    -  `watson` - Connects to the IBM Cloud Speech-to-Text service
    -  `microsoft` - Connects to the Microsoft Speech-to-Text service
-   `audiobook.cover.art.add` - Specifies whether  or not cover art  is to be added to an album (default `yes`)
-   `audiobook.cover.art.image` - Specifies the cover art to be used for an album, the default will use
    the image plug-in alter the file `cfg/coverart.png` 


# Contribute

PRs accepted.

# License

[Apache 2.0](LICENSE) © 2019 Jason Fox
