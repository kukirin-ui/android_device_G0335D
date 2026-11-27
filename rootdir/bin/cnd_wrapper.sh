#!/system/bin/sh
if [ -x /system/bin/cnd.real ]; then
    exec /system/bin/cnd.real "$@"
else
    exec /system/bin/cnd "$@"
fi
