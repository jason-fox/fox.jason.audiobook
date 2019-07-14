<h1>Install</h1>

The audiobook plug-in has been tested against [DITA-OT 3.x](http://www.dita-ot.org/download). It is recommended that you
upgrade to the latest version.

## Installing DITA-OT

<a href="https://www.dita-ot.org"><img src="https://www.dita-ot.org/images/dita-ot-logo.svg" align="right" width="55" height="55"></a>

The DITA-OT Audiobook transform is a plug-in for the DITA Open Toolkit.

-   Full installation instructions for downloading DITA-OT can be found
    [here](https://www.dita-ot.org/3.3/topics/installing-client.html).

    1.  Download the `dita-ot-3.3.zip` package from the project website at
        [dita-ot.org/download](https://www.dita-ot.org/download)
    2.  Extract the contents of the package to the directory where you want to install DITA-OT.
    3.  **Optional**: Add the absolute path for the `bin` directory to the _PATH_ system variable.

    This defines the necessary environment variable to run the `dita` command from the command line.

```console
curl -LO https://github.com/dita-ot/dita-ot/releases/download/3.3/dita-ot-3.3.zip
unzip -q dita-ot-3.3.zip
rm dita-ot-3.3.zip
```

## Installing the Plug-in

-   Run the plug-in installation command:

```console
dita -install https://github.com/jason-fox/fox.jason.audiobook/archive/master.zip
```

The `dita` command line tool requires no additional configuration.

## Installing the FFMpeg tool

<a href="https://ffmpeg.org"><img src="https://tecadmin.net/wp-content/uploads/2013/11/ffmpeg-logo-370x250.png" align="right" height="80" width="118"></a>

FFmpeg is a free software project consisting of a software suite of libraries and programs for handling video, audio,
and other multimedia files and streams. FFmpeg is published under the GNU Lesser General Public License 2.1+ or GNU
General Public License 2+ (depending on which options are enabled).

To download a copy follow the instructions on the [Download page](https://ffmpeg.org/download.html)

## Signing up for a Text-to-Speech Service

Several publically available **text-to-speech** cloud services are available for use, they typically offer a
_try-before-you-buy_ option and generally offer sample access to the service for without cost. Upgrading to a paid
version will be necessary when transforming larger documents.

### IBM Cloud Services

<a href="https://cloud.ibm.com/docs/services/text-to-speech?topic=text-to-speech-gettingStarted"><img src="https://www.nasuni.com/wp-content/uploads/2017/06/ibm-cloud.png" align="right" width="119" height="85"></a>

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


### Microsoft Azure

<a href="https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/get-started"><img src="https://www.confluent.io/wp-content/uploads/MS-Azure_logo_stacked_c-gray_rgb.png" align="right" width="160" height="85"></a>

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
