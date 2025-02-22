#ifndef __CONFIG_H__

/* Define if you have log1p function */
#cmakedefine HAVE_LOG1P 1

/* locate of the xrc files, as defined during configuration */
#define INSTALL_LOCALE_DIR "${INSTALL_LOCALE_DIR}"

/* Location for data, as defined during configuration*/
#define INSTALL_DATA_DIR "${INSTALL_DATA_DIR}/"

/* Location for XRC files and other data, as defined during configuration*/
#define INSTALL_XRC_DIR "${INSTALL_XRC_DIR}/"

/* if FFTW library is available */
#cmakedefine HAVE_FFTW 1

/* if using libepoxy instead of glew */
#cmakedefine HAVE_EPOXY 1

/* Build a fully self contained OSX bundle (with embedded ressources) */
#cmakedefine MAC_SELF_CONTAINED_BUNDLE 1

/* contains directory of HuginStitchProject.app, if MAC_SELF_CONTAINED_BUNDLE 
   is not set. */
#define INSTALL_OSX_BUNDLE_DIR "${INSTALL_OSX_BUNDLE_DIR}"

/* if compiler supports OpenMP */
#cmakedefine HAVE_OPENMP 1

/* if we have C++17 <filesystem> header */
#cmakedefine HAVE_STD_FILESYSTEM 1

/* if using EGL for OpenGL initialization */
#cmakedefine HAVE_EGL 1

/* Build a fully self contained OSX bundle (with embedded ressources) */
#cmakedefine UNIX_SELF_CONTAINED_BUNDLE 1

/* Store settings according to XDG specification, works only with wxWidgets 3.1.1 or later */
#cmakedefine USE_XDG_DIRS 1

#endif
