# Casper VIA S48 (MT8168) Android Development Tree

This is an unofficial, community-maintained Android device tree for the Casper VIA S48 tablet (MediaTek MT8168 / F716). It documents device configuration and compatibility work associated with Android 16 AxionOS 2.9 GSI bring-up. It does not represent official LineageOS or AxionOS device support, or a verified complete source-built ROM.

---

## 1. Specifications & Geometry

* **SoC:** MediaTek MT8168 (4x ARM Cortex-A53 @ 2.0 GHz stock, up to 2.1 GHz overclocked)
* **GPU:** ARM Mali-G52 MP1 (Bifrost)
* **RAM:** 2 GB / 3 GB LPDDR4
* **Storage:** 32 GB eMMC 5.1
* **Display:** 8.0" / 10.1" IPS LCD (1280x800 WXGA) @ 60 Hz
* **Touchscreen:** Silead GSL1680 (in-kernel MTK driver)
* **Wireless:** MediaTek MT6631 Dual-Band 802.11ac Wi-Fi + Bluetooth 5.0
* **Partition Scheme:** Dynamic Partitions (`super.img`):
  * Physical Super Partition Size: `5,890,572,288` bytes (0x15f1b0000)
  * Dynamic Partition Group: `main` (`5,886,377,984` bytes)
  * Logical Partitions: `system`, `vendor`, `product`
* **Boot Image Architecture:** Android Boot v2
  * Kernel Load Base: `0x40000000`
  * Kernel Offset: `0x00080000`
  * Ramdisk Offset: `0x04000000`
  * Tags Offset: `0x00000100`
  * DTB Offset: `0x00000100`

---

## 2. Integrated Android 16 Compatibility Solutions

1. **MP2 Audio Codec Crash Fix:** Overlays `/vendor/etc/media_codecs_mediatek_audio.xml` without `OMX.MTK.AUDIO.DECODER.MP2`, preventing `AudioCapabilities::getDefaultFormat()` integer subtraction underflow in `libmedia_codeclist_capabilities.so`.
2. **DFE Storage Configuration:** `rootdir/fstab.mt8168` disables File-Based Encryption (`fileencryption=aes-256-xts`) to avoid TrustKernel Keymaster 4.0 crypto deadlock on Android 16.
3. **VINTF Target FCM Level 4:** Injects `vintf/compatibility_matrix.4.xml` to bridge Android 10 vendor HALs with Android 16 framework requirements.
4. **FUSE-BPF Bypass:** Configures `persist.sys.fuse.bpf.override=false` and `persist.sys.phh.bpf=false` to use standard userspace FUSE daemon on Linux 4.14.
5. **USB Gadget Binding:** Sets `sys.usb.controller=11201000.usb` for instant ADB enumeration.

---

## 3. Directory Layout

```
device_casper_via_s48/
├── AndroidProducts.mk        # Product registration
├── BoardConfig.mk            # Hardware, partition sizes, kernel geometry
├── device.mk                 # Product packages, overlays, and copy rules
├── axion_via_s48.mk          # AxionOS / LineageOS product definition
├── rootdir/
│   ├── fstab.mt8168          # Default DFE fstab
│   ├── fstab.mt8168.fbe      # Reference FBE fstab
│   ├── init.mt8168.rc        # MediaTek core init script
│   └── init.mt8168.usb.rc    # USB gadget controller binding
├── configs/
│   └── media_codecs_mediatek_audio.xml
├── vintf/
│   ├── compatibility_matrix.4.xml
│   └── manifest.xml
├── overlay/                  # Tablet resource overlays
└── sepolicy/vendor/          # Vendor SELinux policies
```

---

## Project Status

- **Working system baseline:** AxionOS 2.9 Android 16 GSI.
- **Kernel:** Linux 4.14.141 with a tested 2.1 GHz experimental variant.
- **Distribution format:** Raw Android partition images (`.img`), optionally compressed for download.
- **PixelOS Android 16:** Unsuccessful boot test; archived in the development wiki.
- **BlazeAOSP Android 17:** Unsuccessful experimental bring-up; not a supported release.

This repository contains development configuration. A working GSI does not establish that a complete ROM builds successfully from this tree.

Do not flash images without checking their hashes, partition sizes, device identity, and rollback procedure.

Development history: https://github.com/AtillaTokmak/via_s48_development_wiki
