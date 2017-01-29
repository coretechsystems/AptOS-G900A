#!/sbin/sh
# Script by ALEXNDR to add $1 to /system/csc/others.xml

if [ -z "`cat /system/csc/others.xml | grep "ALEXNDR"`" ] ; then
    sed -i '/\/FeatureSet/D' /system/csc/others.xml
    sed -i '/\/SamsungMobileFeauture/D' /system/csc/others.xml
    cat $1 >> /system/csc/others.xml
    echo '  </FeatureSet>' >> /system/csc/others.xml
    echo '</SamsungMobileFeauture>' >> /system/csc/others.xml
fi

chown 0:0 /system/csc/others.xml
chmod 644 /system/csc/others.xml
chcon u:object_r:system_file:s0 /system/csc/others.xml

sync
