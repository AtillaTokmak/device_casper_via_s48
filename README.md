# Device Tree: Casper VIA S48 (MT8168 / F716)

This repository contains the device-specific configuration tree for building AOSP, LineageOS, or AxionOS (Android 16 QPR2 / Baklava) on the **Casper VIA S48** tablet.

## Device Specifications

| Feature | Specification |
| :--- | :--- |
| **SoC** | MediaTek MT8168 |
| **CPU** | Quad-Core ARM Cortex-A53 @ 2.0 GHz (Overclockable to 2.1 GHz) |
| **GPU** | ARM Mali-G52 (Bifrost) |
| **Motherboard / ODM** | `F716` / `sanmu` |
| **RAM** | 2 GB LPDDR4 |
| **Internal Storage** | 32 GB eMMC 5.1 |
| **Display** | 8.0" IPS LCD, 800 x 1280 pixels @ 56.1 Hz (`jd9365da`) |
| **Touchscreen** | Silead GSLX68X / MTK TPD |
| **Battery** | 4000 mAh Li-Po |
| **Stock OS Baseline** | Android 10 (`Casper_VIA_S48_0_20220606_C1.03`) |
| **Target OS** | Android 16 (Baklava / API 36) |

## Android 16 Porting Fixes Integrated in This Tree

1. **Disable Force Encryption (DFE):** Stripped `fileencryption=aes-256-xts` and `checkpoint=block` from `rootdir/fstab.mt8168` to eliminate Keymaster 4.0 / Keystore2 deadlocks.
2. **MP2 Codec UBSAN Fix:** Removed `OMX.MTK.AUDIO.DECODER.MP2` from `configs/media_codecs_mediatek_audio.xml` to prevent integer underflow SIGABRT in `system_server`.
3. **VINTF Compatibility Level 4:** Packaged `vintf/compatibility_matrix.4.xml` to satisfy target-level 4 vendor manifest.
4. **FUSE-BPF Override Properties:** Integrated `persist.sys.fuse.bpf.override=false` into `device.mk` for Linux 4.14 compatibility.
5. **USB Gadget Controller:** Configured `sys.usb.controller=11201000.usb` and configfs triggers for instant ADB enumeration.
