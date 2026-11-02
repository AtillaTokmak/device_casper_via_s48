#
# Copyright (C) 2026 The LineageOS / AxionOS Project
#
# BoardConfig for Casper VIA S48 (MT8168 / F716)
#

DEVICE_PATH := device/casper/via_s48

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# Board / Platform
TARGET_BOARD_PLATFORM := mt8168
TARGET_BOOTLOADER_BOARD_NAME := mt8168
TARGET_NO_BOOTLOADER := true

# Kernel Architecture & Build
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/casper/mt8168
TARGET_KERNEL_CONFIG := tb8168p1_64_bsp_f716_defconfig

# Kernel Image Geometry (Android Boot v2)
# Verified against boot_oc_2.1ghz_android16.img and MT8168 BROM bootloader specifications
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00080000
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_TAGS_OFFSET := 0x00000100
BOARD_DTB_OFFSET := 0x00000100
BOARD_BOOT_HEADER_VERSION := 2
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Kernel Command Line
# NOTE: 'androidboot.selinux=permissive' is used for bring-up until all legacy Android 10 vendor policies are mapped.
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user androidboot.selinux=permissive

# Physical Partition Sizes (eMMC 32 GB Geometry - Verified via MT8168 Scatter File)
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432       # 32 MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432   # 32 MB
BOARD_CACHEIMAGE_PARTITION_SIZE := 117440512     # 112 MB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 24326963200
BOARD_FLASH_BLOCK_SIZE := 131072

# Dynamic Partitions (Super Partition Geometry)
# Hardware super partition size: 0x15f1b0000 = 5,890,572,288 bytes (5617 MB)
# Main dynamic partition group reserved for system, vendor, and product
BOARD_SUPER_PARTITION_SIZE := 5890572288
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 5886377984                    # 5890572288 minus 4MB metadata
BOARD_MAIN_PARTITION_LIST := system vendor product

# File Systems
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true

# Recovery Configuration
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_CHARACTERISTICS := tablet
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

# VINTF Specifications
# Target FCM Level 4 (Android 10) compatibility matrix
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/vintf/compatibility_matrix.4.xml
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/vintf/manifest.xml

# SELinux Policy
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Media & Graphics
TARGET_USES_HWC2 := true
TARGET_SCREEN_DENSITY := 213

# Inherit proprietary vendor definitions
-include vendor/casper/via_s48/BoardConfigVendor.mk
