#!/system/bin/sh
if [ -x /system/bin/netmgrd.real ]; then
    exec /system/bin/netmgrd.real "$@"
else
    exec /system/bin/netmgrd "$@"
fi
