#!/system/bin/sh
export LD_PRELOAD=/vendor/lib64/libprotobuf_stub_cne.so
if [ -x /system/bin/netmgrd.real ]; then
    exec /system/bin/netmgrd.real "$@"
else
    exec /system/bin/netmgrd "$@"
fi
