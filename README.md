# ppgtk v1.0beta

A PDF presenter for GTK

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

## See also

 * [GTK+ 3](https://developer.gnome.org/gtk3/stable): utilized widget toolkit
 * [Poppler library](http://poppler.freedesktop.org): utilized PDF library
 * [PDF Presenter Console](http://davvil.github.io/pdfpc): the tool PPGtk was adopted from
 * [Open PDF Presenter](https://code.google.com/p/open-pdf-presenter): a similar tool but using the QT library.

