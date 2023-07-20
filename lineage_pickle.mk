#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from pickle device
$(call inherit-product, device/oneplus/pickle/device.mk)

# Prebuilt gapps
$(call inherit-product, vendor/gapps/common/common-vendor.mk)

PRODUCT_DEVICE := pickle
PRODUCT_NAME := lineage_pickle
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := CPH2411
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="sys_mssi_64_cn_armv82-user 13 TP1A.220905.001 1676518158691 release-keys"

BUILD_FINGERPRINT := OnePlus/CPH2411/OP5566L1:13/TP1A.220905.001/S.e4ee63_1:user/release-keys
