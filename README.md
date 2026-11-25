# GREE G0335D Device Tree (LOS 15.1 / Android 8.1)

Device tree for GREE G0335D / G3S (msm8996), LineageOS 15.1 port.
Place at device/gree/g0335d/ inside the LOS 15.1 source tree.

## Kernel
Build from source: kernel/gree/msm8996 (fork: kukirin-ui/android_kernel_G0335D_msm8996Pro)
CONFIG: g0335d_defconfig (CONFIG_QCA_CLD_WLAN=m)
Brightness: FT8716 uses bl_ctrl_dcs.

## Vendor extras
Stock 64-bit libs (libmdmdetect, cne*) are in proprietary-files.txt.
Shim: rootdir/etc/g0335d_shims.rc sets LD_SHIM_LIBS for protobuf symbols.
