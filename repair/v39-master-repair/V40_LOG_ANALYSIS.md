# G0335D v40 Log Analysis (2026-11-28)

Build: LineageOS 15.1 / Android 8.1 SDK 27, MSM8996, arm64.
Fingerprint: GREE/lineage_g0335d/g0335d:8.1.0/OPM7.181205.001/0d7f0d114e:userdebug/test-keys.

## Executive
The v40 logs identify a new, exact Bluetooth service linker failure and repeated Qualcomm location/IMS package-class mismatches. The prior v39 Zygote supplementary-GID signature (setgroups failed / gids.size) was not found in this v40 log. That absence is encouraging but is not proof the patch was integrated or fully fixed.

## P0 — Bluetooth HIDL service crashes (confirmed)
Executable /vendor/bin/hw/android.hardware.bluetooth@1.0-service-qti repeatedly aborts with:
`CANNOT LINK EXECUTABLE ... library "android.hidl.base@1.0.so" not found`
Service is repeatedly restarted. Verify the HIDL base library is built and packaged for arm64 in the correct partition and visible to the service linker. Inspect ELF DT_NEEDED, SONAME, image contents and linker namespace/path. Do not copy/symlink a random version. Only after service starts should firmware/HCI be investigated.

## P1 — Qualcomm location service references missing class (confirmed)
system_server repeatedly tries to instantiate `com.qualcomm.location.izatserviceprovider.service.NetworkLocationService` from `/system/priv-app/com.qualcomm.location/com.qualcomm.location.apk`, but the class is missing. Inspect APK manifest/DEX and product package selection. Restore a matching package if required, or disable the specific component only if location support is intentionally excluded and dependencies are checked.

## P1 — IMS autoboot receiver missing (confirmed)
`/system/vendor/app/ims/ims.apk` lacks `org.codeaurora.ims.ImsServiceAutoboot` referenced by configuration, causing repeated `org.codeaurora.ims` crashes. Verify matching IMS APK/vendor package set; disable the receiver only if IMS is intentionally unsupported.

## P2 — Wi-Fi HAL driver failure (unresolved)
HAL starts, repeatedly reports `Failed to load WiFi driver`, then stops. Check module presence, load return code, vermagic/symbols, firmware/NVRAM, init ordering and expected paths. HAL messages alone don't identify root cause.

## P2 — Goodix fingerprint device unavailable (unresolved)
`open /dev/goodix_fp failed`; service `gx_fpd` restarting. Check kernel probe/node creation, ueventd ownership/mode, service identity and SELinux label. Do not create a fake node or globally weaken SELinux.

## P2 — Audio config and ABI issues (confirmed)
`audio_effects.xml` TinyXML2 parse error; `acdb_loader_init_v3` unresolved symbol. Validate exact XML against the expected Android 8.1 schema; identify the correct ACDB library/ABI pairing. Do not stub the missing symbol.

## P3 — LatinIME JNI missing
LatinIME fails loading `libjni_latinimegoogle.so`. Check chosen IME build variant and JNI packaging for arm64; select a matching variant if Google JNI is not intended.

## Verification checklist
- Bluetooth service starts and stays running; no missing HIDL base linker abort.
- No location NetworkLocationService ClassNotFoundException.
- No IMS ImsServiceAutoboot ClassNotFoundException.
- WLAN module loads; interface scans/connects.
- Goodix node exists and fingerprint works.
- XML parses, ACDB symbol resolves, speaker/earpiece/mic routing works.
- LatinIME JNI loads and keyboard works.
- Recheck Zygote supplementary GIDs on boot.
- Full compile, image inspection, flash and device validation required.

**Scope:** Log diagnosis only; no full ROM compile, flash, or hardware test claimed.
