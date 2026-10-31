#
# Copyright (C) 2026 The LineageOS / AxionOS Project
#
# Product Definition for Casper VIA S48
#

# Inherit from axion common product
$(call inherit-product, vendor/axion/config/common_full_tablet_wifionly.mk)

# Inherit from device configuration
$(call inherit-product, device/casper/via_s48/device.mk)

PRODUCT_NAME := axion_via_s48
PRODUCT_DEVICE := via_s48
PRODUCT_BRAND := Casper
PRODUCT_MODEL := VIA S48
PRODUCT_MANUFACTURER := Casper

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=VIA_S48_0 \
    TARGET_DEVICE=VIA_S48_0
