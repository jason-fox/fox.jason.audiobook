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

# Usage

TO DO

# Contribute

PRs accepted.

# License

[Apache 2.0](LICENSE) © 2019 Jason Fox
