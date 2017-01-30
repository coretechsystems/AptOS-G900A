#!/sbin/sh
# Script 1/2 by ALEXNDR to keep original CSC pack

mkdir -p /tmp/kcsc/system/etc

cp -R /system/csc /tmp/kcsc/system
cp -R /system/finder_cp /tmp/kcsc/system
cp -R /system/VODB /tmp/kcsc/system
cp -R /system/sipdb /tmp/kcsc/system
cp -R /system/wallpaper /tmp/kcsc/system
cp /system/CSCVersion.txt /tmp/kcsc/system
cp /system/SW_Configuration.xml /tmp/kcsc/system
cp /system/etc/csc_*.txt /tmp/kcsc/system/etc
cp /system/etc/hidden_*.txt /tmp/kcsc/system/etc
cp /system/etc/enforce*.txt /tmp/kcsc/system/etc
cp /system/etc/lteon_netlist.xml /tmp/kcsc/system/etc
cp /system/etc/plmn_delta.bin /tmp/kcsc/system/etc

if [ ! -z "`cat /system/CSCVersion.txt | grep "OLB"`" ] ; then
    mkdir /tmp/kcsc/system/fonts
    cp /system/fonts/DroidSansFallback.ttf /tmp/kcsc/system/fonts
    cp /system/fonts/GS_Thai_111220.ttf /tmp/kcsc/system/fonts
    cp /system/fonts/HanumanNew-Regular.ttf /tmp/kcsc/system/fonts
    cp /system/fonts/SamsungLao.ttf /tmp/kcsc/system/fonts
    cp /system/fonts/ZawgyiOne2008.ttf /tmp/kcsc/system/fonts
    cp /system/etc/fallback_fonts*.xml /tmp/kcsc/system/etc
fi

if [ -h /system/csc_contents ] ; then
    echo -n "/system/csc/`cat /system/csc/sales_code.dat`/csc_contents" > /tmp/kcsc/csc_contents
fi

sync
