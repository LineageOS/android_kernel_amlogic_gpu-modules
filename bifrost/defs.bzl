load("//build/kernel/kleaf:kernel.bzl", "kernel_module")

def mali_bifrost_module(name, kernel_build, deps = None):
    kernel_module(
        name = name,
        srcs = ["//vendor/amlogic/gpu-modules/bifrost:bifrost_srcs"],
        makefile = ["//vendor/amlogic/gpu-modules/bifrost:Makefile"],
        deps = deps,
        outs = ["mali_kbase.ko"],
        kernel_build = kernel_build,
    )
