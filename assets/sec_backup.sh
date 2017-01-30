#!/sbin/sh
# Script 1/2 by ALEXNDR to keep additional system files associated with security

if [ -f /system/.pin ] ; then
    mkdir -p /tmp/sec/system
    cp /system/.pin /tmp/sec/system
fi

if [ -d /system/priv-app/com.avast.* ] ; then
    mkdir -p /tmp/sec/system/priv-app
    cp -R /system/priv-app/com.avast.* /tmp/sec/system/priv-app
elif [ -f /system/priv-app/com.avast.* ] ; then
    mkdir -p /tmp/sec/system/priv-app/com.avast.android.antithelf
    cp /system/priv-app/com.avast.* /tmp/sec/system/priv-app/com.avast.android.antithelf
fi

if [ -f /system/etc/com.avast.* ] ; then
    mkdir -p /tmp/sec/system/etc
    cp /system/etc/com.avast.* /tmp/sec/system/etc
fi

sync
