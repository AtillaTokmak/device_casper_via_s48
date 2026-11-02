# Casper VIA S48 Patched Unlocked Recovery

> **Binary:** `recovery-s48-adbroot-nosig.img`  
> **Size:** `33,554,432` bytes (32 MiB, exact MT8168 recovery partition size)  
> **SHA-256:** `88c4eadd5f59da2cef7a6058c09bc90fb50787f4484313629e172bc000a4295c`  
> **Base:** Factory Stock Android 10 (MT8168 / F716)

---

## Key Features & Binary Patches

1. **ZIP Signature Verification Bypass (`nosig`):**
   - Function at `0x344E0` in `/system/bin/recovery` patched with `mov w0, #1; ret` (`20008052c0035fd6`).
   - Bypasses cryptographic signature validation, allowing unsigned ROMs, Magisk, and modification ZIPs to be installed via `adb sideload` or recovery update without signature verification aborts.

2. **Insecure Root ADB Access (`adbroot`):**
   - Helper function at `0x2D10` in `/system/bin/adbd` patched to bypass root privilege dropping.
   - System properties set in `prop.default`:
     ```properties
     ro.secure=0
     ro.adb.secure=0
     ro.debuggable=1
     ```
   - Grants immediate unrestricted root (`#`) shell when connected via USB in recovery mode.

---

## Flashing Instructions

### Method 1: Via Fastboot (Bootloader)
```bash
fastboot flash recovery recovery-s48-adbroot-nosig.img
fastboot reboot recovery
```

### Method 2: Via SP Flash Tool
1. Load `MT8168_Android_scatter.txt`.
2. Select **Download Only**.
3. Check only the **`recovery`** partition.
4. Select `recovery-s48-adbroot-nosig.img`.
5. Click **Download** and connect the tablet while powered off.
