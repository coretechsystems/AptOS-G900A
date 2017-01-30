#!/sbin/sh
# Script by ALEXNDR to check if stock recovery need to be updated during install

KWV=`getprop "ro.warranty_bit"`

if [ "$KWV" == "0" ] ; then
    sed -i '/stock.recovery/d' /tmp/options.prop
    echo "" >> /tmp/options.prop
    echo "stock.recovery=1" >> /tmp/options.prop
fi

sync
