# XLingPaper

An attempt at distributing XLingPaper (with XMLMind XML Editor) as a snap package.

Installing this package implies that you agree with the terms of the
[XMLmind XML Editor Personal Edition License](https://xmlmind.com/xmleditor/license_xxe_perso.html).

More info at https://software.sil.org/xlingpaper/

# ToDo List
- XXE doesn't find xelatex
  in the snap's shell:
  - ```which xelatex``` turns up nothing
  - ```ls /usr/texbinxlingpaper2020```
    dvipdfmx    kpsereadlink  kpsewhich  texhash	xelatex
    kpseaccess  kpsestat	  mktexlsr   xdvipdfmx	xetex
  - ```cat /opt/xxe-perso-8_2_0/addon/XLingPap/configuration/XeLaTeXVersion.txt```
    2020
- Try to use gedit snap: connect to gedit plug; to get around dbus confinement problem.
- Printing probably doesn't work (not yet tested)
