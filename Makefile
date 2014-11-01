#!/usr/bin/env make

ifneq ($(shell which colorgcc),"")
CC:=colorgcc
endif

## Some custom directories
# All C- and Object-Code will go in this directory
DIRBUILD := build
# A directory containing the GLib Object in GOB2 builder files
DIRSRC := src

CFLAGS=-g -DDEBUG -std=c99 -W -Wall -Wextra -fopenmp -I$(DIRBUILD) $(shell pkg-config --cflags glib-2.0 gobject-2.0 gio-2.0 gtk+-3.0 poppler)
export CFLAGS
ifeq ($(PROFILE),yes)
	override CFLAGS += -pg
endif

# Fetch all targets
GOBS := $(shell find $(DIRSRC) -type f -name '*.gob')
HEADERS := $(patsubst $(DIRSRC)/%.gob,$(DIRBUILD)/%.h,$(GOBS)) \
			$(patsubst $(DIRSRC)/%.h,$(DIRBUILD)/%.h,$(shell find $(DIRSRC) -type f -name '*.h'))
CODES := $(patsubst $(DIRSRC)/%.gob,$(DIRBUILD)/%.c,$(GOBS)) \
			$(patsubst $(DIRSRC)/%.h,$(DIRBUILD)/%.h,$(shell find $(DIRSRC) -type f -name '*.c'))
OBJECTS := $(patsubst $(DIRSRC)/%.gob,$(DIRBUILD)/%.o,$(GOBS))
LIBS := $(shell cd $(DIRSRC); ls -1 | grep -v '^bin$$')

# Set flags for linking
GTK3=$(shell pkg-config --libs gtk+-3.0)
POPPLER=$(shell pkg-config --libs poppler poppler-glib)

LDFLAGS=-g -lm $(GTK3) $(POPPLER)

PROGRAM := ppgtk
PROGRAM_ARGS := ~/gobics/promotion/presentation-2014-07-31-bonn/Praesentation_Wide.pdf

# Keep intermediate files
.SECONDARY:

# Targets without a resulting file
.PHONY: all objects headers clean

# Remove predefined targets
.SUFFIXES:

$(DIRBUILD)/ppgtk.h: $(filter $(DIRBUILD)/ppgtk/%.h,$(HEADERS))
	@if [ ! -f $(dir $@) ]; then mkdir -p $(dir $@); fi
	@echo "   LST  "$<
	@for h in $(patsubst $(DIRBUILD)/%,%,$(filter $(DIRBUILD)/ppgtk/%,$(HEADERS))); do \
		echo "#include <$$h>"; \
	done > $@

# Build Code and header from GOB
$(DIRBUILD)/%.c $(DIRBUILD)/%.h: $(DIRSRC)/%.gob
	@if [ ! -f $(dir $@) ]; then mkdir -p $(dir $@); fi
	@echo "   GOB2 "$<
	@gob2 --no-private-header --file-sep='/' --output-dir $(DIRBUILD) $<

$(DIRBUILD)/%.c: $(DIRSRC)/%.c
	@echo "   CP   "$<
	@cp $< $@

$(DIRBUILD)/%.h: $(DIRSRC)/%.h
	@echo "   CP   "$<
	@cp $< $@

%.o: %.c $(HEADERS)
	@if [ ! -f $(dir $@) ]; then mkdir -p $(dir $@); fi
	@echo "   CC   "$@
	@$(CC) $(CFLAGS) -o $@ -c $<

$(DIRBUILD)/libppgtk.a: $(OBJECTS)
	@echo "   AR   "$(notdir $@)
	@ar rcs $@ $+

all: $(PROGRAM)

libs: $(patsubst %,c/lib%.a,$(LIBS))

clean:
	rm -rf $(DIRBUILD)
	rm -rf doc
	rm -f  $(PROGRAM)
	
test: $(PROGRAM)
	#if [ -f "$(DIRBUILD)/test.prseq" ]; then rm $(DIRBUILD)/test.prseq; fi
	./$(PROGRAM) $(PROGRAM_ARGS)

testt: $(PROGRAM)
	time ./$(PROGRAM) $(PROGRAM_ARGS)

testd: $(PROGRAM)
	G_MESSAGES_DEBUG=all ./$(PROGRAM) $(PROGRAM_ARGS)

testv: $(PROGRAM)
	G_MESSAGES_DEBUG=all valgrind ./$(PROGRAM) $(PROGRAM_ARGS)

test-memory: $(PROGRAM)
	G_DEBUG=gc-friendly G_SLICE=always-malloc valgrind --suppressions=glibsupp.txt --leak-check=full --show-reachable=yes ./$(PROGRAM) $(PROGRAM_ARGS)

headers: $(HEADERS)

objects: $(OBJECTS)

ppgtk: $(OBJECTS)
	@echo "   LD   "$@
	$(CC) $+ $(LDFLAGS) -o $@
