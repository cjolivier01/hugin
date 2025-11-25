Bazel build for Hugin (2024.0.1)

Overview
- This repository now includes a Bazel build that drives the existing CMake build.
- Bazel produces a fully installed tree under `bazel-bin/hugin_all_install` with all binaries and data.

Prerequisites
- Bazel 6.0+ (Bazelisk works fine).
- CMake and required system dependencies (wxWidgets, libpano13, vigra, exiv2, tiff, jpeg, png, zlib, fftw, boost, lcms2, OpenGL, glew/epoxy, sqlite3, OpenEXR, etc.) installed on your system and findable by CMake.

Build
- From the repository root (this directory):

  # Full Hugin build (all binaries and data)
  bazel build //:hugin_all --action_env=PATH=$PATH

  # Only the CLI tools used by HockeyMOM
  bazel build //:cmdline-tools --action_env=PATH=$PATH

- Outputs are installed under:

  - Full build: `bazel-bin/hugin_all_install`
  - CLI tools: `bazel-bin/cmdline-tools_install`

- Common binaries are in the corresponding `bin` subdirectory (e.g. `hugin`, `PTBatcherGUI`, `autooptimiser`, `cpfind`, `nona`, etc., for the full build, and `pto_gen`, `autooptimiser`, `nona` for `cmdline-tools`).

Notes
- The Bazel rule is a thin wrapper around CMake (see `tools/cmake/cmake_build.bzl`).
- On systems where `cmake` isn’t on `/usr/bin`, ensure it’s on PATH (hence the `--action_env=PATH=$PATH`).
- You can pass additional CMake cache entries by adjusting `cache_entries` in `BUILD.bazel` if needed.
