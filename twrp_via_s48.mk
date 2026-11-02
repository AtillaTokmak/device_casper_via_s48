#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 TeamWin Recovery Project
#
# Product Definition for Casper VIA S48 (MT8168 / F716)
#

# Inherit from common TWRP configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from device configuration
$(call inherit-product, device/casper/via_s48/device.mk)

PRODUCT_DEVICE := via_s48
PRODUCT_NAME := twrp_via_s48
PRODUCT_BRAND := Casper
PRODUCT_MODEL := VIA S48
PRODUCT_MANUFACTURER := Casper

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=VIA_S48_0 \
    TARGET_DEVICE=VIA_S48_0
