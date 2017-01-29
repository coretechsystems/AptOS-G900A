#!/sbin/sh
# /sbin/mount -a
busybox mount -o rw,remount /system

rm -rf /system/etc/init.d/96settings
rm -rf /system/etc/init.d/97settings

busybox mount -o ro,remount /system
