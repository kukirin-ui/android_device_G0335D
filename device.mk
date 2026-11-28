# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

$(call inherit-product-if-exists, vendor/gree/g0335d/g0335d-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:system/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:system/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:system/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:system/etc/permissions/android.hardware.sensor.relative_humidity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Device launched with Android 7.1 (API 25)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=25

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

# Haters gonna hate..
PRODUCT_CHARACTERISTICS := nosdcard

# Audio
PRODUCT_PACKAGES += \
    libprotobuf_stub_cne \
    audiod \
    audio.a2dp.default \
    audio.primary.msm8996 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libvolumelistener \
    tinymix

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/audio_output_policy.conf:system/vendor/etc/audio_output_policy.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/listen_platform_info.xml:system/etc/listen_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tasha.xml:system/etc/mixer_paths_tasha.xml \
    $(LOCAL_PATH)/audio/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_wcd9330.xml:system/etc/sound_trigger_mixer_paths_wcd9330.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/surround_sound_3mic/surround_sound_rec_AZ.cfg:system/etc/surround_sound_3mic/surround_sound_rec_AZ.cfg

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml

# Camera
PRODUCT_PACKAGES += \
    Snap

# Display
PRODUCT_PACKAGES += \
    copybit.msm8996 \
#    gralloc.msm8996 \
    hwcomposer.msm8996 \
    memtrack.msm8996 \
    liboverlay \
    libtinyxml

# Display calibration
PRODUCT_PACKAGES += \
    libjni_livedisplay


# Fingerprint sensor
PRODUCT_PACKAGES += \
    fingerprintd

# For android_filesystem_config.h
PRODUCT_PACKAGES += \
    fs_config_files

# FM
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni \
    qcom.fmradio

# GPS
PRODUCT_PACKAGES += \
    gps.msm8996 \
    libcurl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/etc/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/etc/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/etc/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/etc/lowi.conf:system/etc/lowi.conf \
    $(LOCAL_PATH)/gps/etc/sap.conf:system/etc/sap.conf \
    $(LOCAL_PATH)/gps/etc/xtwifi.conf:system/etc/xtwifi.conf

# IPv6
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# IR
PRODUCT_PACKAGES += \
    remoteir.default

# IRQ
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/synaptics_dsx.kl:system/usr/keylayout/synaptics_dsx.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/qpnp_pon.kl:system/usr/keylayout/qpnp_pon.kl \
    $(LOCAL_PATH)/keylayout/tiny4412-key.kl:system/usr/keylayout/tiny4412-key.kl

# Lights
PRODUCT_PACKAGES += \
    lights.msm8996

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# NFC
# The G0335D stock system has no NFC HAL or firmware; the hardware is not present.
# The NFC config here comes from the port baseline; its vendor source (nxp-nfc) is
# not consistent with this libnfc-nci version and cannot build, so it is disabled.
# PRODUCT_PACKAGES += \
#     com.android.nfc_extras \
#     com.nxp.nfc.nq \
#     nfc_nci.pn54x.default \
#     NQNfcNci \
#     nqnfcee_access.xml \
#     nqnfcse_access.xml \
#     Tag
#
# PRODUCT_COPY_FILES += \
#     $(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
#     $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libextmedia_jni \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# Power
PRODUCT_PACKAGES += \
    power.msm8996

# QMI
PRODUCT_PACKAGES += \
    libjson

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.bt.sh \
    init.qcom.power.rc \
    init.qcom.rc \
    init.qcom.sh \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    ueventd.qcom.rc

# RIL
PRODUCT_PACKAGES += \
    librmnetctl \
    libxml2 \
    libprotobuf-cpp-full

# Sensors
PRODUCT_PACKAGES += \
    sensors.msm8996

# Wifi
PRODUCT_PACKAGES += \
    ipacm \
    ipacm-diag \
    IPACM_cfg.xml \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/wifi/hostapd.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/wifi/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/qca_cld/WCNSS_cfg.dat

$(call inherit-product, frameworks/native/build/phone-xxxhdpi-4096-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-4096-hwui-memory.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/manifest.xml:$(TARGET_COPY_OUT_VENDOR)/manifest.xml

# HWC workaround
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.hwcomposer=msm8996 \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    persist.sys.ui.hw=true

# 32-bit only: 64-bit counterpart is copied by g0335d-vendor.mk (proprietary source).
PRODUCT_COPY_FILES += \
    vendor/gree/g0335d/vendor/lib/libmdmdetect.so:$(TARGET_COPY_OUT_VENDOR)/lib/libmdmdetect.so

# OpenCL: 64-bit for HALs, 32-bit for mm-qcamera-daemon (error: library "libOpenCL.so" not found)
# libsdmcore/libsdmutils/libsdm-disp-vndapis are copied by g0335d-vendor.mk (v11 display stack block).
PRODUCT_COPY_FILES += \
    vendor/gree/g0335d/vendor/lib64/libOpenCL.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libOpenCL.so \
    vendor/gree/g0335d/vendor/lib/libOpenCL.so:$(TARGET_COPY_OUT_VENDOR)/lib/libOpenCL.so

# SF queryDisplayProperties workaround
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    debug.sf.disable_backpressure=1

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/surfaceflinger_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/surfaceflinger_config.xml

# cnd/netmgrd/rild protobuf LD_PRELOAD wrappers (upstream ffeff91 + 7bb1c0f)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/bin/cnd_wrapper.sh:system/bin/cnd_wrapper.sh \
    $(LOCAL_PATH)/rootdir/bin/netmgrd_wrapper.sh:system/bin/netmgrd_wrapper.sh \
    $(LOCAL_PATH)/rootdir/bin/rild_wrapper.sh:system/bin/rild_wrapper.sh

# System_server(PMS) needs lineage platform resources:
#   org.lineageos.platform.internal.R.array.config_vendorPlatformSignatures
# Missing -> Resources$NotFoundException in PackageManagerService.<init>.
PRODUCT_PACKAGES += \
    org.lineageos.platform-res \
    org.lineageos.platform \
    org.lineageos.platform.xml

# upstream 3279092: WebView package for zygote
PRODUCT_PACKAGES += \
    webview

# upstream 914a4ac: PhoneWindowManager reads lineagesettings at boot
PRODUCT_PACKAGES += \
    LineageSettingsProvider

# upstream 674ac7c/b037c24 (dup): harmless default
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.device.keys.default=0

# Panel node fallback (upstream 9846f5f)
# NOTE: no kernel code in kernel_g0335d_android81_los151 reads this;
# it does NOT fix the SHARP/ft8716 panel mismatch.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.panel.fallback=1

# --- v22: HIDL HAL services (upstream only added the -impl libs) ---
# 7.1 device tree shipped audiod + legacy audio.primary; 8.1 audioserver requires
# android.hardware.audio@2.0::IDevicesFactory from a real service.
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-service \
    android.hardware.keymaster@3.0-service \
    android.hardware.sensors@1.0-service \
    android.hardware.power@1.0-service \
    android.hardware.light@2.0-service \
    android.hardware.vibrator@1.0-service \
    android.hardware.health@1.0-service

# upstream 4ecbf8b / be9b8ef / 2e158c5: impl libs
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.soundtrigger@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.health@1.0-impl \
    android.hardware.thermal@1.1-impl \
    android.hardware.configstore@1.0-impl \
    android.hardware.keymaster@3.0-impl \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.light@2.0-impl \
    android.hardware.power@1.0-impl \
    android.hardware.sensors@1.0-impl \
    android.hardware.vibrator@1.0-impl \
    libshim_camera \
    android.hardware.bluetooth@1.0 \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# sensors@1.0-impl (multihal) reads /vendor/etc/sensors/hals.conf and requires
# absolute paths; the 7.1 blob only has the relative name "sensors.ssc.so".
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors_hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# --- v22: 8.1 audio policy (audio_policy.conf is 7.1 format, ignored by 8.1) ---
PRODUCT_COPY_FILES += \
    hardware/qcom/audio-caf/msm8996/configs/msm8996/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# camera.msm8996.so (system/lib/hw, 32-bit) needs this at dlopen time
# upstream d3b767c (fix/camera-hdr-lib-and-wrappers-import)
PRODUCT_COPY_FILES += \
    vendor/gree/g0335d/vendor/lib/libarcsoft_high_dynamic_range.so:system/lib/libarcsoft_high_dynamic_range.so

# --- v33: 补 Trebuchet（桌面 / Launcher）---
# 上游 vendor/lineage/config/common.mk 里本来就有 PRODUCT_PACKAGES += Trebuchet，
# 但实测产物 obj/APPS 与 system/priv-app 里都没有该模块，这里显式再补一次。
# 属于上游没有的改动，用户明确批准。
PRODUCT_PACKAGES += Trebuchet

# --- v34: 补 org.lineageos.profiles.xml ---
# vendor/lineage/config/common.mk 尾部用 include 引入 lineage_sdk_common.mk，
# 但该文件的 PRODUCT_COPY_FILES 没有进入本产品（产物 system/etc/permissions
# 里 backup.xml / org.lineageos.android.xml / privapp-permissions-lineage.xml
# 同样缺失，build.prop 里 ro.build.selinux、ro.com.google.clientidbase 也没有）。
# 缺这个 xml 时 ProfileManagerService 不发布 binder 服务("feature not declared")，
# SystemUI 的 KeyguardViewMediator.isProfileDisablingKeyguard 会 NPE。
# 这里按设备实测（v34）显式补一条，范围仅此一个文件。
PRODUCT_COPY_FILES += \
    vendor/lineage/config/permissions/org.lineageos.profiles.xml:system/etc/permissions/org.lineageos.profiles.xml

# v34d: LineageParts 是 priv-app，请求 CHANGE_CONFIGURATION / READ_SEARCH_INDEXABLES /
# WRITE_MEDIA_STORAGE / WRITE_SECURE_SETTINGS 四个特权权限，白名单在下面这个文件里
# （vendor/lineage/config/permissions/privapp-permissions-lineage.xml 第 58~63 行）。
# 它同样是 common.mk:97 的 COPY 项，产物里缺失。当前 ro.control_privapp_permissions
# 未设置（log 模式）不会拦，但白名单本是上游应有的，一并补上。
PRODUCT_COPY_FILES += \
    vendor/lineage/config/permissions/privapp-permissions-lineage.xml:system/etc/permissions/privapp-permissions-lineage.xml


# --- v34b: 补 LineageParts 与开机动画 ---
# 与 v33 Trebuchet、v34 profiles.xml 同一原因：vendor/lineage/config/common.mk 里
# 的 PRODUCT_PACKAGES 没有进入本产品（产物里 LineageParts / bootanimation.zip /
# Eleven / AudioFX 等全部缺失）。
#   * LineageParts 缺失 => Settings 的 8 个页面 inflate LineagePartsPreference 时
#     抛 "Part not found: <key>"，设置直接停止运行（关于手机/显示/声音/手势等）。
#   * bootanimation.zip 缺失 => /system/media 为空，开机只有 AOSP 内置 ANDROID 文字。
# 两处模块上游本来就有，这里按实测缺失显式补一次。
PRODUCT_PACKAGES += \
    LineageParts \
    bootanimation.zip
