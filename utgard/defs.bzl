load("//build/kernel/kleaf:kernel.bzl", "kernel_module")

def mali_utgard_module(name, kernel_build, deps = None):
    kernel_module(
        name = name,
        srcs = ["//vendor/amlogic/gpu-modules/utgard:utgard_srcs"],
        makefile = ["//vendor/amlogic/gpu-modules/utgard:Makefile"],
        deps = deps,
        outs = ["mali.ko"],
        kernel_build = kernel_build,
    )
