#!/system/bin/sh
export LD_PRELOAD=/vendor/lib64/libprotobuf_stub_cne.so
exec /system/bin/rild "$@"
