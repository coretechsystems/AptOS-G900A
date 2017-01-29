#!/sbin/sh
# Script by ALEXNDR to enable init.d in Samsung Qualcomm devices
# running KitKat stock kernel (thanks to shazzl & Ryuinferno @ XDA)

chown 0:0 /system/vendor/overlay
chmod 755 /system/vendor/overlay
chcon u:object_r:system_file:s0 /system/vendor/overlay

chown 0:0 /system/vendor/overlay/*
chmod 664 /system/vendor/overlay/*
chcon u:object_r:system_file:s0 /system/vendor/overlay/*

sync
