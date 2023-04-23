
#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Enforce generic ramdisk allow list
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# Prebuilt gapps
$(call inherit-product, vendor/gapps/common/common-vendor.mk)

PRODUCT_PACKAGES += \
    bootctrl.default \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2.recovery

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.common@6.0-util \
    android.hardware.audio.common@7.0-util \
    android.hardware.audio.effect@6.0-util \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio@6.0-impl \
    android.hardware.audio@7.0-impl \
    android.hardware.audio@6.0.vendor \
    android.hardware.audio@7.0.vendor \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.soundtrigger@2.3-impl \
    audio.bluetooth.default \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.stub \
    libaudiopreprocessing \
    libbundlewrapper \
    libdownmix \
    libdynproc \
    libeffectproxy \
    libldnhncr \
    libreverbwrapper \
    libvisualizer \
    libaudiofoundation.vendor \
    libtinycompress

PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.0 \
    android.hardware.soundtrigger@2.1 \
    android.hardware.soundtrigger@2.2

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0 \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.bluetooth@1.1 \
    android.hardware.bluetooth@1.1.vendor \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.bluetooth.audio@2.1-impl

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# CAS
PRODUCT_PACKAGES += \
    libclearkeycasplugin \
    android.hardware.cas@1.2-service-lazy

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.common@1.0.vendor \
    android.hardware.camera.device@3.2.vendor \
    android.hardware.camera.device@3.3.vendor \
    android.hardware.camera.device@3.4.vendor \
    android.hardware.camera.device@3.5.vendor \
    android.hardware.camera.device@3.6.vendor \
    android.hardware.camera.provider@2.4 \
    android.hardware.camera.provider@2.5 \
    android.hardware.camera.provider@2.6 \
    android.hardware.camera.provider@2.4.vendor \
    android.hardware.camera.provider@2.5.vendor \
    android.hardware.camera.provider@2.6.vendor

# Display
PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0.vendor \
    android.hardware.graphics.composer@2.3-service \
    libdrm.vendor \
    libvulkan

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0.vendor

# Gnss
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1 \
    android.hardware.gnss@2.1.vendor \
    android.hardware.gnss.visibility_control@1.0.vendor \
    android.hardware.gnss.measurement_corrections@1.1.vendor

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# FS tools
 PRODUCT_PACKAGES += \
    e2fsck \
    e2fsck.recovery \
    resize2fs \
    resize2fs.recovery \
    tune2fs \
    tune2fs.recovery

# Freeform Multiwindow
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml

# Fingerprint
#PRODUCT_PACKAGES += \
#   android.hardware.biometrics.fingerprint@2.3-service.oplus

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0 \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.memory.block@1.0 \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor \
    vndservicemanager

# IMS
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

PRODUCT_PACKAGES += \
    libshim_vtservice

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-oplus.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-oplus.xml

# LiveDisplay
#PRODUCT_PACKAGES += \
#    vendor.lineage.livedisplay@2.1-service.oplus

# Lights
PRODUCT_PACKAGES += \

# MTK plpath utils
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/mtk_plpath_utils:$(TARGET_COPY_OUT_SYSTEM)/bin/mtk_plpath_utils \
    $(LOCAL_PATH)/prebuilts/mtk-plpath-utils.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/mtk-plpath-utils.rc \
    $(LOCAL_PATH)/prebuilts/mtk_plpath_utils:recovery/root/system/bin/mtk_plpath_utils \
    $(LOCAL_PATH)/prebuilts/mtk-plpath-utils.rc:recovery/root/system/etc/init/mtk-plpath-utils.rc

# NDK Platform backend
PRODUCT_PACKAGES += \
    android.hardware.gnss-V1-ndk_platform.vendor:64 \
    android.hardware.memtrack-V1-ndk_platform.vendor:64 \
    android.hardware.power-V2-ndk_platform.vendor:64 \
    android.hardware.security.keymint-V1-ndk_platform.vendor:64 \
    android.hardware.security.sharedsecret-V1-ndk_platform.vendor:64 \
    android.hardware.security.secureclock-V1-ndk_platform.vendor:64 \
    android.hardware.vibrator-V2-ndk_platform.vendor:64 \
    android.system.keystore2-V1-ndk_platform.vendor:64 \
    android.hardware.light-V1-ndk_platform.vendor:64


# MTK InCallService
PRODUCT_PACKAGES += \
    MtkInCallService

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    com.android.nfc_extras \
    libchrome.vendor \
    NfcNci \
    SecureElement \
    Tag

# Overlays
$(call inherit-product, hardware/oplus/overlay/qssi/qssi.mk)

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_PACKAGES += \
    CarrierConfigResCommon \
    FrameworksResTarget \
    OPlusFrameworksResCommon \
    OPlusSettingsResCommon \
    OPlusSystemUIResCommon \
    WifiResTarget

# ORMS
PRODUCT_PACKAGES += \
    orms_core_config

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0.vendor \
    android.hardware.power@1.2.vendor

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.2 \
    android.hardware.radio@1.2.vendor \
    android.hardware.radio@1.6 \
    android.hardware.radio@1.6.vendor \
    android.hardware.radio.config@1.3 \
    android.hardware.secure_element@1.2 \
    android.hardware.secure_element@1.2.vendor \
    android.hardware.secure_element@1.1 \
    android.hardware.secure_element@1.1.vendor

# Rootdir
PRODUCT_PACKAGES += \
    init.insmod.sh \
    swap_enable.sh \

PRODUCT_PACKAGES += \
    set_permissive.sh \
    fstab.mt6895 \
    factory_init.connectivity.common.rc \
    factory_init.connectivity.rc \
    factory_init.project.rc \
    factory_init.rc \
    init.aee.rc \
    init.cgroup.rc \
    init.connectivity.common.rc \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6895.rc \
    init.mt6895.usb.rc \
    init.mtkgki.rc \
    init.project.rc \
    init.sensor_2_0.rc \
    init_conninfra.rc \
    meta_init.connectivity.common.rc \
    meta_init.connectivity.rc \
    meta_init.modem.rc \
    meta_init.project.rc \
    meta_init.rc \
    meta_init.vendor.rc \
    multi_init.rc \
    ueventd.mtk.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.emmc:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.emmc \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6895:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.mt6895

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6895:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6895

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.emmc:recovery/root/first_stage_ramdisk/fstab.emmc \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6895:recovery/root/first_stage_ramdisk/fstab.mt6895

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal \
    sensors.oplus

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 31

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/oplus

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.oplus

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0.vendor

# Vibrator
#PRODUCT_PACKAGES += \
#    vendor.qti.hardware.vibrator.service.oplus

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.3.vendor \
    android.hardware.usb.gadget@1.1.vendor

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml

# VNDK
PRODUCT_PACKAGES += \
    libutils-v32
PRODUCT_EXTRA_VNDK_VERSIONS := 31

# Inherit the proprietary files
$(call inherit-product, vendor/oneplus/pickle/pickle-vendor.mk)
