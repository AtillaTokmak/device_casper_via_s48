#
# Copyright (C) 2026 The LineageOS / AxionOS Project
#
# Device Configuration for Casper VIA S48 (MT8168)
#

DEVICE_PATH := device/casper/via_s48

# Inherit proprietary blobs
$(call inherit-product-if-exists, vendor/casper/via_s48/via_s48-vendor.mk)

# Legacy VNDK-29 Support for MediaTek Android 10 Proprietary HALs
PRODUCT_EXTRA_VNDK_VERSIONS += 29

# Resource Overlays (RRO)
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Ramdisk & Rootfs Mount Architecture
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/fstab.mt8168:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt8168 \
    $(DEVICE_PATH)/rootdir/fstab.mt8168:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mt8168 \
    $(DEVICE_PATH)/rootdir/init.mt8168.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mt8168.rc \
    $(DEVICE_PATH)/rootdir/init.mt8168.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mt8168.usb.rc

# Media Codec Configuration (MP2 audio crash eliminated)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/media_codecs_mediatek_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_audio.xml

# System Properties (Storage & Framework Compatibility)
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.fuse.bpf.override=false \
    persist.sys.phh.bpf=false

# Vendor Properties (Hardware & Display Configuration)
PRODUCT_VENDOR_PROPERTIES += \
    sys.usb.controller=11201000.usb \
    persist.sys.bt.unsupported.commands=182,174 \
    ro.surface_flinger.has_wide_color_display=false \
    ro.surface_flinger.has_HDR_display=false \
    ro.sf.lcd_density=213

# Essential Hardware Services & Packages
PRODUCT_PACKAGES += \
    android.hardware.usb@1.1-service.basic \
    android.hardware.health-service.example \
    android.hardware.memtrack-service.example
