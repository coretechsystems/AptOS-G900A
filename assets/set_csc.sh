#!/sbin/sh
# Script by ALEXNDR
# Set CSC to $1

rm -f /system/etc/hidden_*.txt
rm -f /system/etc/csc_*.txt
rm -f /system/csc_contents
rm -f /system/csc/*.*

cp -fR /system/csc/common/system/* /system
cp -fR /system/csc/$1/system/* /system
ln -s /system/csc/$1/csc_contents /system/csc_contents

chown 0:0 /system/etc/plmn_delta.bin
chmod 644 /system/etc/plmn_delta.bin
chcon u:object_r:system_file:s0 /system/etc/plmn_delta.bin

chown 0:0 /system/etc/lteon_netlist.xml
chmod 644 /system/etc/lteon_netlist.xml
chcon u:object_r:system_file:s0 /system/etc/lteon_netlist.xml

chown 0:0 /system/etc/hidden_*.txt
chmod 644 /system/etc/hidden_*.txt
chcon u:object_r:system_file:s0 /system/etc/hidden_*.txt

chown 0:0 /system/etc/csc_*.txt
chmod 644 /system/etc/csc_*.txt
chcon u:object_r:system_file:s0 /system/etc/csc_*.txt

chown 0:0 /system/csc/*.*
chmod 644 /system/csc/*.*
chcon u:object_r:system_file:s0 /system/csc/*.*

if [ -d /system/finder_cp ] ; then
    chown 0:0 /system/finder_cp
    chmod 755 /system/finder_cp
    chcon u:object_r:system_file:s0 /system/finder_cp
    chown 0:0 /system/finder_cp/*
    chmod 644 /system/finder_cp/*
    chcon u:object_r:system_file:s0 /system/finder_cp/*
fi

if [ -d /system/wallpaper ] ; then
    chown 0:0 /system/wallpaper
    chmod 755 /system/wallpaper
    chcon u:object_r:system_file:s0 /system/wallpaper
    chown 0:0 /system/wallpaper/*
    chmod 644 /system/wallpaper/*
    chcon u:object_r:system_file:s0 /system/wallpaper/*
fi

sync
