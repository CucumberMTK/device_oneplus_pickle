#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),pickle)
include $(call all-subdir-makefiles,$(LOCAL_PATH))

include $(CLEAR_VARS)

ALLOCATOR_SYMLINK := $(TARGET_OUT_VENDOR)/bin/hw/android.hardware.graphics.allocator@4.0-service-mediatek
$(ALLOCATOR_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/android.hardware.graphics.allocator@4.0-service-mediatek.mt6895 $@

ALL_DEFAULT_INSTALLED_MODULES += $(ALLOCATOR_SYMLINK)

MDOTA_SYMLINK := $(TARGET_OUT_VENDOR)/etc/mdota
$(MDOTA_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf /mnt/vendor/mdota $@

ALL_DEFAULT_INSTALLED_MODULES += $(MDOTA_SYMLINK)

DB_SYMLINK := $(TARGET_OUT_VENDOR)/bin/crossbuild/DataSet/SQLiteModule/db/ParameterDB.db
$(DB_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf /odm/bin/crossbuild/DataSet/SQLiteModule/db/mt6895/ParameterDB.db $@

ALL_DEFAULT_INSTALLED_MODULES += $(DB_SYMLINK)

PICKLE_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/, $(strip $(shell cat $(DEVICE_PATH)/symlink/mt6895.txt)))
$(PICKLE_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(PICKLE_SYMLINK)

ODM_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/, $(strip $(shell cat $(DEVICE_PATH)/symlink/odm.txt)))
$(ODM_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf /odm/$(subst $(TARGET_OUT_VENDOR)/,,$(subst /Param,/mt6895/Param,$@)) $@

ALL_DEFAULT_INSTALLED_MODULES += $(ODM_SYMLINK)

AUDIO_PRIMARY_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/audio.primary.mt6895.so
AUDIO_PRIMARY_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/audio.primary.mt6895.so
$(AUDIO_PRIMARY_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf audio.primary.mediatek.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(AUDIO_PRIMARY_SYMLINK)

AUDIO_R_SUBMIX_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/audio.r_submix.mt6895.so
AUDIO_R_SUBMIX_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/audio.r_submix.mt6895.so
$(AUDIO_R_SUBMIX_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf audio.r_submix.mediatek.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(AUDIO_R_SUBMIX_SYMLINK)

GATEKEEPER_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.default.so
GATEKEEPER_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.default.so
$(GATEKEEPER_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf libSoftGatekeeper.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(GATEKEEPER_SYMLINK)

SENSOR_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/hw/sensors.mt6895.so
$(SENSOR_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf sensors.mediatek.V2.0.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(SENSOR_SYMLINK)

VULKAN_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/vulkan.mt6895.so
VULKAN_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/vulkan.mt6895.so
$(VULKAN_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf ../egl/libGLES_mali.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(VULKAN_SYMLINK)

endif
