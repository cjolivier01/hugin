#ifndef __CONFIG_H__

/* Define if you have log1p function */
#define HAVE_LOG1P 1

/* locate of the xrc files, as defined during configuration */
#define INSTALL_LOCALE_DIR "/usr/local/share/locale"

/* Location for data, as defined during configuration*/
#define INSTALL_DATA_DIR "/usr/local/share/hugin/data/"

/* Location for XRC files and other data, as defined during configuration*/
#define INSTALL_XRC_DIR "/usr/local/share/hugin/xrc/"

/* if FFTW library is available */
#define HAVE_FFTW 1

/* if using libepoxy instead of glew */
/* #undef HAVE_EPOXY */

/* Build a fully self contained OSX bundle (with embedded ressources) */
/* #undef MAC_SELF_CONTAINED_BUNDLE */

/* contains directory of HuginStitchProject.app, if MAC_SELF_CONTAINED_BUNDLE 
   is not set. */
#define INSTALL_OSX_BUNDLE_DIR ""

/* if compiler supports OpenMP */
#define HAVE_OPENMP 1

/* if we have C++17 <filesystem> header */
/* #undef HAVE_STD_FILESYSTEM */

/* if using EGL for OpenGL initialization */
/* #undef HAVE_EGL */

/* Build a fully self contained OSX bundle (with embedded ressources) */
/* #undef UNIX_SELF_CONTAINED_BUNDLE */

/* Store settings according to XDG specification, works only with wxWidgets 3.1.1 or later */
#define USE_XDG_DIRS 1

#endif
