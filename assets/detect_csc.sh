#!/sbin/sh
# Script by ALEXNDR to detect CSC automatically and replace CSC=KCSC entry in options.prop
# In case of empty /system partition detection will not be possible and CSC will be set to BTU.
# If detected CSC is not included in multi CSC package, then CSC=KCSC entry will remain untouched

if [ -f /system/csc/sales_code.dat ] ; then
    CURRENT_CSC=`cat /system/csc/sales_code.dat`
    if [ ! -z "`cat /tmp/SW_Configuration.xml | grep "/"$CURRENT_CSC"/"`" ] ; then
        sed -i '/KCSC/d' /tmp/options.prop
        echo "CSC="$CURRENT_CSC"" >> /tmp/options.prop
    fi
else
    sed -i '/KCSC/d' /tmp/options.prop
    echo "CSC=BTU" >> /tmp/options.prop
fi

sync
