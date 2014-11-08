# **ppgtk**

A PDF presenter for GTK

## Version

0.1.0

## Description

**ppgtk** (short for "PDF Presenter for GTK") is a PDF presentation tool using GTK3. 
The tool is mainly inspired by the [PDF Presenter Console](http://davvil.github.io/pdfpc).

**ppgtk** supports setups with more than one monitor. In such setup, the presentation is shown in full screen mode on one of the monitors and a presenter console is shown on a second.

The [Poppler library](http://poppler.freedesktop.org) is utilized to read PDF documents and to render the slides into the graphical user interface.

## Screenshot

The following screenshot shows the main user interface - the console window:

![ppgtk screenshot](images/ppgtk_screenshot.png?raw=true "Screenshot of the ppgtk console")

## Installation

**ppgtk** pre-requires GTK3 and Poppler libraries. You can install the libraries on Debian and Ubuntu easily:

`sudo apt-get install libgtk-3-0 libpoppler-glib8`

### ... from source

To compile **ppgtk** from scratch, the corresponding header files are required:

`sudo apt-get install libgtk-3-dev libpoppler-glib-dev`

Also the compiler tools are required:

`sudo apt-get install gob2 gcc make`

A makefile is provided, thus one can compile **ppgtk** easily:

`make **ppgtk**`

### ... prebuild

Currently, **ppgtk** is beta software and binary files are not released so far.

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

**ppgtk** is mainly developed and tested on [Debian/GNU Linux](http://www.debian.org) Wheezy. 

**ppgtk** is written using [GOB2](http://www.jirka.org/gob.html), a preprocessor that generates valid [GObject](http://developer.gnome.org/gobject/stable) C code. Afterwards, the C code is compiled as usual. If you want to hack on **ppgtk**, you should have a look on the [GOB2 Manual](http://www.jirka.org/gob2.1.html).

### Documentation 

[Doxygen](http://www.doxygen.org) is used for code documentation. To generate the documentation, the [gob-doc](http://github.com/landesfeind/gob-doc) tool is required as Doxygen input filter.

## Author, Bugs, and Contribution

**ppgtk** was written by [Manuel Landesfeind](http://www.landesfeind.de) and 
[the code is hosted on Github](http://github.com/landesfeind/**ppgtk**).

Help in improving **ppgtk** is very welcome. If you have any suggestions on **ppgtk** or
want to help, please [issue a request on GitHub](https://github.com/landesfeind/**ppgtk**/issues).
Bugs should also be reported as an issue on Github.

## See also

 * [GTK+ 3](https://developer.gnome.org/gtk3/stable): utilized widget toolkit
 * [Poppler library](http://poppler.freedesktop.org): utilized PDF library
 * [PDF Presenter Console](http://davvil.github.io/pdfpc): the tool from which **ppgtk** was adopted
 * [Open PDF Presenter](https://code.google.com/p/open-pdf-presenter): a similar tool but using the QT library
