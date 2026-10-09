#
# Copyright (C) 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


GPU_TYPE:=mali450
GPU_ARCH:=utgard
GPU_DRV_VERSION?=r10p2

ifeq ($(O),)
out_dir := .
else
out_dir := $(O)
endif

MALI_SRC := $(KERNEL_SRC)/$(M)/$(GPU_DRV_VERSION)
MALI_PLAT := $(KERNEL_SRC)/$(M)/platform
MALI_OUT := $(abspath $(out_dir)/$(M)/$(GPU_DRV_VERSION))

EXTRA_INCLUDE := -I$(MALI_OUT)/include \
		 -I$(MALI_OUT)/linux/license/gpl \
		 -I$(MALI_OUT)/common \
		 -I$(MALI_OUT)/linux \
		 -I$(MALI_OUT) \
		 -I$(MALI_OUT)/platform/meson_bu

KBUILD_CFLAGS_MODULE += $(GKI_EXT_MODULE_PREDEFINE)

modules:
	mkdir -p $(MALI_OUT)
	cp -rL -u $(MALI_SRC)/. $(MALI_OUT)/
	cp -rL -u $(MALI_PLAT) $(MALI_OUT)/
	$(MAKE) -C $(KERNEL_SRC) M=$(MALI_OUT) \
	EXTRA_CFLAGS="-DCONFIG_MALI400=m -DCONFIG_MALI450=m" \
	EXTRA_CFLAGS+="-Wno-error -Wno-pointer-sign -Wno-error=frame-larger-than= $(EXTRA_INCLUDE) $(KBUILD_CFLAGS_MODULE)" \
	EXTRA_LDFLAGS+="--strip-debug" \
	CONFIG_MALI400=m CONFIG_MALI450=m CONFIG_AM_VDEC_H264_4K2K=y \
	KBUILD_EXTRA_SYMBOLS=$(abspath $(out_dir)/../common_drivers/Module.symvers) \
	modules
	ln -sf $(MALI_OUT)/Module.symvers $(abspath $(out_dir)/$(M))/Module.symvers

all: modules

modules_install:
	$(MAKE) INSTALL_MOD_STRIP=1 M=$(MALI_OUT) -C $(KERNEL_SRC) modules_install

clean:
	rm -rf $(MALI_OUT)

.PHONY: modules all modules_install clean
