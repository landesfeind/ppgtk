#ifndef PPGTK_PPGTK_H
#define PPGTK_PPGTK_H

#include <libintl.h>
#define _(x) gettext(x)

#include <glib.h>
#include <gio/gio.h>
#include <gtk/gtk.h>
#include <glib/poppler.h>

#include <ppgtk/slide.h>
#include <ppgtk/presenter.h>
#include <ppgtk/display.h>
#include <ppgtk/timedialog.h>

#define PPGTK_NAME "PPGtk"
#define PPGTK_NAME_LONG _("Pdf Presenter for GTK")

#define PPGTK_VERSION_MAJOR 1
#define PPGTK_VERSION_MINOR 0
#define PPGTK_VERSION_PATCH 0

#define PPGTK_AUTHOR "Manuel Landesfeind"

#define PPGTK_CHECK_VERSION(a,b,c) PPGTK_VERSION_MAJOR < a ? FALSE : PPGTK_VERSION_MINOR < b ? FALSE : PPGTK_VERSION_PATCH < c ? FALSE : TRUE

#define PPGTK_UNUSED(x) (void)(x)


#define PPGTK_OBJECT_IS(o, t) \
	if( ! G_IS_OBJECT(o) ){ \
		g_warning("Expected %s object but got a non-object", "IMPLEMENT ME"); \
		return; \
	} \
	else if( t != G_OBJECT_TYPE(o) ){ \
		g_warning("Expected %s object but got %s", "IMPLEMENT ME", G_OBJECT_TYPE_NAME(o)); \
		return; \
	}

#endif
