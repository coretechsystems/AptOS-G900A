#!/sbin/sh
# Script by ALEXNDR
# Wipe /data partition excluding private contents

cd /data

for i in `ls -a` ; do
    if [ "$i" != "media" ] ; then
        rm -fR "$i"
    fi
done

rm -fR /data/media/0/.*
rm -fR /data/media/0/Android
rm -fR /data/media/0/data
rm -fR /data/media/obb/*

echo -n "2" > /data/.layout_version

sync
