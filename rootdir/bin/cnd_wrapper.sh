#!/system/bin/sh
export LD_PRELOAD=/vendor/lib64/libprotobuf_stub_cne.so
if [ -x /system/bin/cnd.real ]; then
    exec /system/bin/cnd.real "$@"
else
    exec /system/bin/cnd "$@"
fi
