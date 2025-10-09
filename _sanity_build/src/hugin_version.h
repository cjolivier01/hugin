#ifndef __HUGIN_VERSION_H__

#define VERSION_MAJOR 2024
#define VERSION_MINOR 0
#define VERSION_PATCH 1
#define HUGIN_WC_REVISION ead3af10a01a
#define HUGIN_API_VERSION "2024.0"

#if defined _WIN32 || defined __APPLE__
#define PACKAGE_VERSION "2024.0.1 built by "
#define DISPLAY_VERSION "2024.0.1.ead3af10a01a built by "
#else
#define PACKAGE_VERSION "2024.0.1"
#define DISPLAY_VERSION "2024.0.1.ead3af10a01a"
#endif

/* this is a hg checkout, tag is as such
 * all builds from HG will be considered development versions
 */
/* #undef HUGIN_DEVELOPMENT_VERSION */

#endif
