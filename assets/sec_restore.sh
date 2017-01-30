#!/sbin/sh
# Script 2/2 by ALEXNDR to keep additional system files associated with security
# (put it BEFORE global "set_perm" or "set_metadata" entries for /system contents in updater-script)

if [ -d /tmp/sec/system ] ; then
    cp -fR /tmp/sec/system/* /system
    cp -f /tmp/sec/system/.* /system
fi

rm -fR /tmp/sec

sync
