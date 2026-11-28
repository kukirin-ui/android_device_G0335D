# G0335D v39 Master Repair

Scope: LineageOS 15.1 / Android 8.1 on GREE G0335D / MSM8996Pro, based on the provided bootloop_error.txt and G0335D_v39_logs_20261128.zip, plus public device-tree source review.

## Priority 0 — Zygote crash (confirmed)
Logs show two fatal child-start failures: setgroups(EINVAL), gids.size=10 and 14. phone_gids diagnostic includes -1. Negative supplementary GIDs are invalid. Patch 0001 filters negative GIDs, logs the discarded count, preserves valid GIDs, and keeps the fatal path if setgroups still fails. This is a defensive guard, not the source mapping correction.

Trace the invalid GID back to permission-to-GID definitions and PackageManager group resolution in frameworks/base/data/etc/platform.xml and related mapping inputs. Do not substitute an arbitrary real GID.

## Wi-Fi
Repeated android.hardware.wifi@1.0-service: Failed to load WiFi driver. Device config uses /system/lib/modules/wlan.ko and symlink to qca_cld/qca_cld_wlan.ko. Evidence is insufficient to distinguish missing module, kernel ABI/vermagic/symbol mismatch, module-init failure, firmware missing, or init ordering. Capture module ls/stat, modinfo, uname, insmod/modprobe exit and dmesg before changing paths.

## Fingerprint
Goodix HAL reports Fp::connect failed, repeatedly cannot open /dev/goodix_fp and flips persist.sys.fp.goodix to 0. Check kernel driver/node creation, actual node path, permissions/ownership, ueventd/init, SELinux and HAL ABI. Don't create fake device nodes or globally loosen SELinux.

## Bluetooth
Enable timeout followed by com.android.bluetooth ANR; dmesg has repeated BT failures. Inspect init sequence, firmware/NV files, transport (SMD/serial), controller/HCI bring-up and service dependencies. Don't change buildcfg feature flags without specific evidence.

## USB
UsbPortManager cannot find USB HAL. Device manifest reviewed lists mapper, Bluetooth, fingerprint and Wi-Fi, but no USB HAL; inspected device.mk excerpt does not show a USB HAL service package. Confirm the exact Android 8.1 USB HAL implementation and service/init rc exists in the source tree before adding product package and manifest. No speculative package/manifest patch included.

## Audio
Evidence: audio_effects.xml TinyXML parse failure; undefined acdb_loader_init_v3 symbol; amplifier init failure; IO-policy file fallback. Inspect whether the ROM expects legacy .conf or XML; verify installed config path and syntax. Identify loaded ACDB vendor library and ABI/symbol exports. Verify mixer/amp topology against actual hardware. Don't swap proprietary blobs blindly.

## LatinIME
UnsatisfiedLinkError for libjni_latinimegoogle.so. Verify LatinIME variant, expected JNI module and APK native library directories/ABIs. Fix packaging/build variant, not by copying an arbitrary library.

## Other
CNSS cannot create /sdcard/wlan_logs; verify storage path/permissions if logging is desired. Codec sample decode messages are not proven boot blockers. Props identify Android 8.1 SDK 27 and ro.zygote=zygote64_32.

## Build and device validation
1. Apply patch to exact LineageOS 15.1 frameworks/base; git apply --check.
2. Build affected native framework and ROM; save complete logs.
3. Flash using established recovery/backup procedure.
4. Capture fresh logcat -b all, dmesg, getprop, ps -A, dumpsys package com.android.phone and phone supplementary GIDs.
5. Confirm Zygote no longer reports setgroups(EINVAL), phone/RIL launches and home screen remains stable.
6. After stable boot, fix Wi-Fi, fingerprint, Bluetooth, USB, audio and LatinIME one subsystem at a time with before/after captures.

Status: only the Zygote GID guard is implemented in this repair bundle. The mapping correction and secondary subsystem repairs, build, flash and boot verification remain outstanding.