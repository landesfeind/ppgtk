
#include <libintl.h>
#define _(x) gettext(x)

#include <glib.h>
#include <gio/gio.h>
#include <gtk/gtk.h>
#include <glib/poppler.h>

#define PPGTK_NAME "PPGtk"
#define PPGTK_NAME_LING _("Pdf Presenter for GTK")

#define PPGTK_VERSION_MAJOR 1
#define PPGTK_VERSION_MINOR 0
#define PPGTK_VERSION_PATCH 0

#define PPGTK_AUTHOR "Manuel Landesfeind"

#define PPGTK_CHECK_VERSION(a,b,c) PPGTK_VERSION_MAJOR < a ? FALSE : PPGTK_VERSION_MINOR < b ? FALSE : PPGTK_VERSION_PATCH < c ? FALSE : TRUE

#define PPGTK_UNUSED(x) (void)(x)
