#!/sbin/sh
# Script by ALEXNDR to enable init.d in Samsung Qualcomm devices
# running KitKat stock kernel (thanks to shazzl & Ryuinferno @ XDA)

if [ -z "`cat /system/etc/init.qcom.post_boot.sh | grep "run-parts"`" ] ; then
    cp /system/etc/init.qcom.post_boot.sh /system/etc/init.qcom.post_boot.bak
    echo "" >> /system/etc/init.qcom.post_boot.sh
    echo "# Init.d support" >> /system/etc/init.qcom.post_boot.sh
    echo "run-parts /system/etc/init.d" >> /system/etc/init.qcom.post_boot.sh
    echo "" >> /system/etc/init.qcom.post_boot.sh
fi

mkdir -p /system/etc/init.d

echo "#!/system/bin/sh" > /system/etc/init.d/00test
echo "# Init.d test" >> /system/etc/init.d/00test
echo "" >> /system/etc/init.d/00test
echo "if [ -f /data/Test.log ] ; then" >> /system/etc/init.d/00test
echo "    rm /data/Test.log" >> /system/etc/init.d/00test
echo "fi" >> /system/etc/init.d/00test
echo "" >> /system/etc/init.d/00test
echo 'echo "Init.d is working !!!" >> /data/Test.log' >> /system/etc/init.d/00test
echo 'echo "excecuted on $(date +"%d-%m-%Y %r" )" >> /data/Test.log' >> /system/etc/init.d/00test
echo "" >> /system/etc/init.d/00test

echo "#!/system/bin/sh" > /system/etc/init.d/08setperm
echo "# Set correct permissions to init.d scripts" >> /system/etc/init.d/08setperm
echo "" >> /system/etc/init.d/08setperm
echo "mount -o remount,rw /system" >> /system/etc/init.d/08setperm
echo "chmod 777 /system/etc/init.d/*" >> /system/etc/init.d/08setperm
echo "mount -o remount,ro /system" >> /system/etc/init.d/08setperm
echo "" >> /system/etc/init.d/08setperm

echo "#!/system/bin/sh" > /system/etc/init.d/99SuperSUDaemon
echo "# Additional way of loading SuperSU daemon" >> /system/etc/init.d/99SuperSUDaemon
echo "" >> /system/etc/init.d/99SuperSUDaemon
echo "/system/xbin/daemonsu --auto-daemon &" >> /system/etc/init.d/99SuperSUDaemon
echo "" >> /system/etc/init.d/99SuperSUDaemon

chown 0:0 /system/etc/init.qcom.post_boot.*
chmod 644 /system/etc/init.qcom.post_boot.*
chcon u:object_r:system_file:s0 /system/etc/init.qcom.post_boot.*

chown 0:0 /system/etc/init.d
chmod 777 /system/etc/init.d
chcon u:object_r:system_file:s0 /system/etc/init.d

chown 0:0 /system/etc/init.d/*
chmod 777 /system/etc/init.d/*
chcon u:object_r:system_file:s0 /system/etc/init.d/*

sync
