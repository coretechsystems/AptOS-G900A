#!/sbin/sh
# Script by ALEXNDR to enable init.d in Samsung Qualcomm devices
# running KitKat stock kernel (thanks to shazzl & Ryuinferno @ XDA)

if [ -z "`cat /system/etc/init.qcom.post_boot.sh | grep "run-parts"`" ] ; then
    echo "" >> /system/etc/init.qcom.post_boot.sh
    echo "# Init.d support" >> /system/etc/init.qcom.post_boot.sh
    echo "run-parts /system/etc/init.d" >> /system/etc/init.qcom.post_boot.sh
    echo "" >> /system/etc/init.qcom.post_boot.sh
fi

mkdir -p /system/etc/init.d

echo "#!/system/bin/sh" > /system/etc/init.d/08setperm
echo "# Set correct permissions to init.d scripts" >> /system/etc/init.d/08setperm
echo "" >> /system/etc/init.d/08setperm
echo "mount -o remount,rw /system" >> /system/etc/init.d/08setperm
echo "chmod 777 /system/etc/init.d/*" >> /system/etc/init.d/08setperm
echo "mount -o remount,ro /system" >> /system/etc/init.d/08setperm
echo "" >> /system/etc/init.d/08setperm

echo "#!/system/bin/sh" > /system/etc/init.d/fstrim
echo "# Run fstrim command to keep internal storage fast" >> /system/etc/init.d/fstrim
echo "" >> /system/etc/init.d/fstrim
echo "fstrim -v /cache" >> /system/etc/init.d/fstrim
echo "fstrim -v /data" >> /system/etc/init.d/fstrim
echo "fstrim -v /system" >> /system/etc/init.d/fstrim
echo "" >> /system/etc/init.d/fstrim

echo "#!/system/bin/sh" > /system/etc/init.d/99SuperSUDaemon
echo "# Additional way of loading SuperSU daemon" >> /system/etc/init.d/99SuperSUDaemon
echo "" >> /system/etc/init.d/99SuperSUDaemon
echo "/system/xbin/daemonsu --auto-daemon &" >> /system/etc/init.d/99SuperSUDaemon
echo "" >> /system/etc/init.d/99SuperSUDaemon

chown 0:0 /system/etc/init.qcom.post_boot.sh
chmod 644 /system/etc/init.qcom.post_boot.sh
chcon u:object_r:system_file:s0 /system/etc/init.qcom.post_boot.sh

chown 0:0 /system/etc/init.d
chmod 777 /system/etc/init.d
chcon u:object_r:system_file:s0 /system/etc/init.d

chown 0:0 /system/etc/init.d/*
chmod 777 /system/etc/init.d/*
chcon u:object_r:system_file:s0 /system/etc/init.d/*

sync
