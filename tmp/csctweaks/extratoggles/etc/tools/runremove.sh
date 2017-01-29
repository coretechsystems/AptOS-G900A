#!/sbin/sh
# /sbin/mount -a
busybox mount -o rw,remount /system

rm -rf /system/etc/init.d/98toggles
rm -rf /system/etc/init.d/99toggles

busybox mount -o ro,remount /system
