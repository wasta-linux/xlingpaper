# Snap Packaging for XXE & XLingPaper

Facilitate the distribution of **XMLMind XML Editor Personal Edition** with the
**XLingPaper** addon for Linux systems.

More info at https://software.sil.org/xlingpaper/ and https://xmlmind.com/xmleditor.

Installing this package requires that the user agree with the terms of the
[XMLmind XML Editor Personal Edition License](https://xmlmind.com/xmleditor/license_xxe_perso.html).
This license must be acknowledged and accepted on first run of the app.

## Motivation
I am disappointed with how fiddly it is to install good software on Linux
systems (I personally use Wasta). Technology geeks make it work, but people who
are less motivated often find that the learning curve and extra steps are not
worth it.

I also see how complicated it can be for the developer to package and distribute
the software. Again, those who are more concerned with development of the app,
especially if it’s cross-platform, are not often motivated to figure out how to
package and distribute it for Windows, MacOS, and Linux/Ubuntu/Wasta/etc.

So I’d like to see how much SIL-affiliated software can be packaged as snap
packages to reduce the friction for both the end user and the developer. I chose
to start with XXE & XLingPaper because it seemed like a good candidate: decently
large user base, non-standard installation method, cross-platform design.

## Software Sources
https://software.sil.org/downloads/r/xlingpaper/XLingPaper-3-9-0XXEPersonalEditionFullSetup.tar.gz http://software.sil.org/downloads/r/xlingpaper/resources/xelatex-upgrade/XeLaTeX2020Installer.tar.gz

## Installation, etc.
### Download
During this experimental phase I’m building the snap package on a cloud server
with a public IP (available upon request). The built packages are made available
using the rsync protocol and can be downloaded with this shell command:

```bash
rsync -Pstuv rsync://<public-ip>/snaps/xlingpaper_3.9_amd64.snap .
```

Or the grsync desktop app can be used, using this as the source:  
rsync://<public-ip>/snaps/xlingpaper_3.9_amd64.snap

The download is around 219 MB.

### Install
```bash
sudo snap install --devmode --dangerous ./xlingpaper_3.9_amd64.snap # assuming the downloaded snap is in the $PWD
```

### Remove
```bash
sudo snap remove xlingpaper
```
