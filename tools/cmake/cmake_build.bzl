def _quote(v):
    return "\"%s\"" % v.replace("\"", "\\\"")

def _cmake_build_impl(ctx):
    install_tree = ctx.actions.declare_directory(ctx.label.name + "_install")

    # Prepare -D cache entries for cmake configure
    cache_entries = ctx.attr.cache_entries
    dflags = []
    for k, v in sorted(cache_entries.items()):
        dflags.append("-D%s=%s" % (k, v))

    # Optional extra args to cmake --build
    build_args = ctx.attr.build_args
    build_args_str = " ".join([str(a) for a in build_args])

    # Targets to build (and then `cmake --install` to copy into install_tree)
    targets = ctx.attr.targets
    target_args = ""
    if targets:
        target_args = " --target " + " ".join(targets)

    # Shell script to configure, build and install
    cmake_bin = ctx.attr.cmake_path
    script = """
        set -euo pipefail
        SRCDIR="."
        BDIR="$PWD/_bazel_cmake_build_{name}"
        INSTALL_DIR="{inst}"
        mkdir -p "$BDIR"
        # Configure
        {cmake} -S "$SRCDIR" -B "$BDIR" {dflags}
        # Build
        {cmake} --build "$BDIR"{target_args} {build_args}
        # Install into declared tree artifact
        {cmake} --install "$BDIR" --prefix "$INSTALL_DIR"
    """.format(
        
        name = ctx.label.name,
        inst = install_tree.path,
        dflags = " ".join(dflags),
        target_args = target_args,
        build_args = build_args_str,
        cmake = cmake_bin,
    )

    ctx.actions.run_shell(
        inputs = ctx.files.srcs,
        outputs = [install_tree],
        command = script,
        progress_message = "CMake building %s" % ctx.label,
        mnemonic = "CMakeBuild",
        execution_requirements = {"no-sandbox": "0"},
        env = ctx.attr.env,
        use_default_shell_env = True,
    )

    return [DefaultInfo(files = depset([install_tree]))]

cmake_build = rule(
    implementation = _cmake_build_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = True, mandatory = True),
        "cache_entries": attr.string_dict(),
        "targets": attr.string_list(),
        "build_args": attr.string_list(),
        "env": attr.string_dict(),
        "cmake_path": attr.string(default = "cmake"),
    },
    doc = "Minimal CMake build rule that configures, builds and installs into a tree artifact.",
)
