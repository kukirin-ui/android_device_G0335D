# G0335D v39 — Master Repair Audit

Target: GREE G0335D / MSM8996Pro, LineageOS 15.1, Android 8.1 (SDK 27). Basis: user-supplied `bootloop_error.txt` and `G0335D_v39_logs_20261128.zip`, and source review of public `android_device_G0335D` device files (`BoardConfig.mk`, `device.mk`, `Android.mk`, `rootdir/etc/manifest.xml`, Wi-Fi config and audio config files). Framework source reviewed from LineageOS 15.1 branch.

## Critical / confirmed — Zygote supplemental GIDs
**Evidence:** `setgroups failed: Invalid argument`, two failures with GID list sizes 10 and 14. The captured phone supplementary GID list includes `-1`. Linux rejects invalid group IDs; child process specialization aborts. This is the first priority because it is on the app-start path.

**Patch:** `patches/frameworks_base/0001-Zygote-filter-invalid-supplementary-gids.patch` filters only negative supplemental GIDs, logs the count, preserves valid values and still aborts if `setgroups()` fails for any remaining reason. Patch syntax/application was checked against a source-shaped test fixture. It has **not** been applied to a complete framework checkout or compiled.

**Root-cause follow-up:** trace the bad value through Android permission-to-GID definitions and PackageManager mapping (`frameworks/base/data/etc/platform.xml` and the branch's actual mapping inputs). Never map `-1` to an arbitrary group ID. This filter is a defensive boot recovery guard, not the final mapping fix.

## Wi-Fi — driver load failure (confirmed, root cause unresolved)
Log repeats `android.hardware.wifi@1.0-service: Failed to load WiFi driver`. Device configuration points at `/system/lib/modules/wlan.ko`, module name `wlan`, with a symlink intended to target `qca_cld/qca_cld_wlan.ko`. Not enough evidence to decide between missing module, bad symlink, kernel ABI/vermagic/symbol mismatch, module-init failure, firmware missing, or init order. Required next evidence: module file paths/permissions, `modinfo`, kernel release, load exit status and surrounding `dmesg`.

## Fingerprint — Goodix unavailable (confirmed)
Log shows `Fp::connect failed`, repeated `open /dev/goodix_fp failed`, and HAL toggles `persist.sys.fp.goodix` to 0. Check kernel driver/device-node creation, node name, ueventd/init ownership/mode, SELinux and vendor HAL ABI. Do not create a fake node or globally weaken SELinux.

## Bluetooth — timeout and ANR (confirmed)
Bluetooth enable timeout and `ANR in com.android.bluetooth`; dmesg includes repeated Bluetooth failures. Inspect firmware/NV, transport (SMD/serial), controller/HCI bring-up, init ordering and vendor service dependencies. Avoid changing bdroid feature flags without specific supporting evidence.

## USB HAL — service missing (confirmed)
`UsbPortManager: connectToProxy: usb hal service not found`. The inspected device manifest lists mapper, Bluetooth, fingerprint and Wi-Fi but no USB HAL; inspected product file did not show an explicit USB HAL service package. Verify the exact Android 8.1 implementation/service/init rc exists in the build tree before adding package + manifest. No speculative package name or declaration is committed.

## Audio — config and vendor library issues (confirmed)
Logs: `audio_effects.xml` TinyXML parse failure; unresolved `acdb_loader_init_v3`; amplifier initialization failed; IO-policy path fallback. Inspect installed config filename/path and whether this branch expects XML or legacy CONF. Identify actual ACDB library loaded and its ABI/exported symbols. Validate mixer/amplifier controls against hardware. Do not swap vendor blobs blindly.

## LatinIME JNI — library missing (confirmed)
`UnsatisfiedLinkError` for `libjni_latinimegoogle.so`. Determine the installed keyboard variant and expected JNI module, ABI and APK native library placement; repair build/packaging variant rather than copying an arbitrary library.

## Other observations
- CNSS log-folder creation fails for `/sdcard/wlan_logs/`; verify path/permissions if WLAN logging is intended. Not proven to be the Wi-Fi driver root cause.
- Codec sample/decode warnings were observed but are not proven boot blockers.
- Props show Android 8.1 SDK 27 and `ro.zygote=zygote64_32`.

## Fix status
- **Implemented:** defensive Zygote negative-GID filter patch.
- **Review/diagnosis only:** invalid GID mapping source, Wi-Fi, fingerprint, Bluetooth, USB, audio, LatinIME.
- **Not done:** full ROM/framework compilation, flashing, boot validation, or hardware tests. These require a complete source checkout/build environment and device access.

## Test sequence
1. Apply patch in the exact LineageOS 15.1 frameworks/base checkout and run `git apply --check`.
2. Compile affected native framework and ROM, save full build logs.
3. Flash only with the user's known recovery/backup method.
4. Capture fresh `logcat -b all -d`, `dmesg`, `getprop`, `ps -A`, `dumpsys package com.android.phone`, and actual phone supplemental GIDs.
5. Confirm no Zygote `setgroups(EINVAL)`, phone/RIL starts, SystemUI/home are stable.
6. Repair secondary subsystems individually, collecting before/after evidence for each.
