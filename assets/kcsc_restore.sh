#!/sbin/sh
# Script 2/2 by ALEXNDR to keep original CSC pack
# (put it BEFORE global "set_perm" or "set_metadata" entries for /system contents in updater-script)

cp -fR /tmp/kcsc/system/* /system

if [ -f /tmp/kcsc/csc_contents ] ; then
    ln -s `cat /tmp/kcsc/csc_contents` /system/csc_contents
fi

if [ -f /system/csc/feature.bak ] ; then
    mv /system/csc/feature.bak /system/csc/feature.xml
fi

if [ -f /system/csc/others.bak ] ; then
    mv /system/csc/others.bak /system/csc/others.xml
fi

CURRENT_CSC=`cat /system/csc/sales_code.dat`

if [ -f /system/csc/feature.xml ] && [ -h /system/csc_contents ] ; then
    cp -f /system/csc/feature.xml /system/csc/$CURRENT_CSC/system/csc/feature.xml
elif [ -f /system/csc/others.xml ] && [ -h /system/csc_contents ] ; then
    cp -f /system/csc/others.xml /system/csc/$CURRENT_CSC/system/csc/others.xml
fi

rm -fR /tmp/kcsc

sync
