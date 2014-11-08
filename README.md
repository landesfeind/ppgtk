# ppgtk

A PDF presenter for GTK

## Version

0.1.0

## Description

PPGtk (short for "PDF Presenter for GTK") is a PDF presentation tool using GTK3. 
The tool is mainly inspired by the [PDF Presenter Console](http://davvil.github.io/pdfpc).

PPGtk supports setups with more than one monitor. In such setup, the presentation is shown in full screen mode on one of the monitors and a presenter console is shown on a second.

The [Poppler library](http://poppler.freedesktop.org) is utilized to read PDF documents and to render the slides into the graphical user interface.

## Installation

PPGtk pre-requires GTK3 and Poppler libraries. You can install the libraries on Debian and Ubuntu easily:

`sudo apt-get install libgtk-3-0 libpoppler-glib8`

### ... from source

To compile PPGtk from scratch, the corresponding header files are required addtionally:

`sudo apt-get install libgtk-3-dev libpoppler-glib-dev`
`sudo apt-get install gob2 gcc make`

A makefile is provided, thus one can compile PPGtk easily:

`make ppgtk`

### ... prebuild

Currently, PPGtk is beta software and binary files are not released so far.

## Features

Most features were adopted to from PDF Presenter Console:

 * Console view display vs. full screen presenter display
 * Freeze presenter display while skimming through the slides in the console display
 * Blank presenter display
 * Display the currently displayed slide and the number of slides in presenter view
 * Configure and display a countdown of the remaining time for the talk

Additional features:

 * Cycle the fullscreen display through the available monitors
 * ...

## Development

PPGtk is mainly developed and tested on [Debian/GNU Linux](http://www.debian.org) Wheezy. 

PPGtk is written using [GOB2](http://www.jirka.org/gob.html), a preprocessor that generates valid [GObject](http://developer.gnome.org/gobject/stable) C code. Afterwards, the C code is compiled as usual. If you want to hack on PPGtk, you should have a look on the [GOB2 Manual](http://www.jirka.org/gob2.1.html).

### Documentation 

[Doxygen](http://www.doxygen.org) is used for code documentation. To generate the documentation, the [gob-doc](http://github.com/landesfeind/gob-doc) tool is required as Doxygen input filter.

## Author, Bugs, and Contribution

PPGtk was written by [Manuel Landesfeind](http://www.landesfeind.de) and 
[the code is hosted on Github](http://github.com/landesfeind/ppgtk).

Help in improving PPGtk is very welcome. If you have any suggestions on PPGtk or
want to help, please [issue a request on GitHub](https://github.com/landesfeind/ppgtk/issues).
Bugs should also be reported as an issue on Github.

## See also

 * [GTK+ 3](https://developer.gnome.org/gtk3/stable): utilized widget toolkit
 * [Poppler library](http://poppler.freedesktop.org): utilized PDF library
 * [PDF Presenter Console](http://davvil.github.io/pdfpc): the tool PPGtk was adopted from
 * [Open PDF Presenter](https://code.google.com/p/open-pdf-presenter): a similar tool but using the QT library
