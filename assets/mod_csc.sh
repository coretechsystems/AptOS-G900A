#!/sbin/sh
# Script by ALEXNDR to add CscFeature MOD ($1) to /system/csc/feature.xml or /system/csc/others.xml
# (includes protection against removal by entering stock recovery)

CURRENT_CSC=`cat /system/csc/sales_code.dat`

if [ -f /system/csc/feature.xml ] ; then
    if [ -z "`cat /system/csc/feature.xml | grep "ALEXNDR"`" ] ; then
        cp /system/csc/feature.xml /system/csc/feature.bak
        sed -i '/\/FeatureSet/d' /system/csc/feature.xml
        sed -i '/\/SamsungMobileFeature/d' /system/csc/feature.xml
        echo '    <!-- ALEXNDR Settings -->' >> /system/csc/feature.xml
        cat $1 >> /system/csc/feature.xml
        echo '    <!-- End of ALEXNDR Settings -->' >> /system/csc/feature.xml
        echo '  </FeatureSet>' >> /system/csc/feature.xml
        echo '</SamsungMobileFeature>' >> /system/csc/feature.xml
        if [ -f /system/csc/feature.xml ] && [ -h /system/csc_contents ] ; then
            cp -f /system/csc/feature.xml /system/csc/$CURRENT_CSC/system/csc/feature.xml
        fi
    fi
elif [ -f /system/csc/others.xml ] ; then
    if [ -z "`cat /system/csc/others.xml | grep "ALEXNDR"`" ] ; then
        cp /system/csc/others.xml /system/csc/others.bak
        sed -i '/\/FeatureSet/d' /system/csc/others.xml
        sed -i '/\/SamsungMobileFeauture/d' /system/csc/others.xml
        echo '    <!-- ALEXNDR Settings -->' >> /system/csc/others.xml
        cat $1 >> /system/csc/others.xml
        echo '    <!-- End of ALEXNDR Settings -->' >> /system/csc/others.xml
        echo '  </FeatureSet>' >> /system/csc/others.xml
        echo '</SamsungMobileFeauture>' >> /system/csc/others.xml
        if [ -f /system/csc/others.xml ] && [ -h /system/csc_contents ] ; then
            cp -f /system/csc/others.xml /system/csc/$CURRENT_CSC/system/csc/others.xml
        fi
    fi
else
    echo '<SamsungMobileFeauture>' > /system/csc/others.xml
    echo '  <FeatureSet>' >> /system/csc/others.xml
    echo '    <!-- ALEXNDR Settings -->' >> /system/csc/others.xml
    cat $1 >> /system/csc/others.xml
    echo '    <!-- End of ALEXNDR Settings -->' >> /system/csc/others.xml
    echo '  </FeatureSet>' >> /system/csc/others.xml
    echo '</SamsungMobileFeauture>' >> /system/csc/others.xml
fi

chown 0:0 /system/csc/*.*
chmod 644 /system/csc/*.*
chcon u:object_r:system_file:s0 /system/csc/*.*

if [ -h /system/csc_contents ] ; then
    chown 0:0 /system/csc/$CURRENT_CSC/system/csc/*.*
    chmod 644 /system/csc/$CURRENT_CSC/system/csc/*.*
    chcon u:object_r:system_file:s0 /system/csc/$CURRENT_CSC/system/csc/*.*
fi

sync
