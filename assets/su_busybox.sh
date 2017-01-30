#!/sbin/sh
# Script by ALEXNDR to obtain root access (thanks to @Chainfire) and to install BusyBox (thanks to @Stephen Stericson)
# (requires already copied binaries, app & script to start the su daemon)

cp /system/xbin/su /system/xbin/daemonsu
cp /system/xbin/su /system/xbin/sugote
cp /system/bin/sh /system/xbin/sugote-mksh
mkdir -p /system/bin/.ext
cp /system/xbin/su /system/bin/.ext/.su

rm /system/bin/app_process
cp /system/bin/app_process32 /system/bin/app_process_init
mv /system/bin/app_process32 /system/bin/app_process32_original
mv /system/bin/install-recovery.sh /system/bin/install-recovery_original.sh

echo 1 > /system/etc/.installed_su_daemon

chown 0:0 /system/xbin/su
chmod 755 /system/xbin/su
chcon u:object_r:system_file:s0 /system/xbin/su

chown 0:0 /system/xbin/daemonsu
chmod 755 /system/xbin/daemonsu
chcon u:object_r:system_file:s0 /system/xbin/daemonsu

chown 0:0 /system/xbin/sugote
chmod 755 /system/xbin/sugote
chcon u:object_r:zygote_exec:s0 /system/xbin/sugote

chown 0:0 /system/xbin/sugote-mksh
chmod 755 /system/xbin/sugote-mksh
chcon u:object_r:system_file:s0 /system/xbin/sugote-mksh

chown 0:0 /system/xbin/supolicy
chmod 755 /system/xbin/supolicy
chcon u:object_r:system_file:s0 /system/xbin/supolicy

chown 0:0 /system/bin/.ext
chmod 777 /system/bin/.ext
chcon u:object_r:system_file:s0 /system/bin/.ext

chown 0:0 /system/bin/.ext/.su
chmod 755 /system/bin/.ext/.su
chcon u:object_r:system_file:s0 /system/bin/.ext/.su

chown 0:2000 /system/bin/app_process_init
chmod 755 /system/bin/app_process_init
chcon u:object_r:system_file:s0 /system/bin/app_process_init

chown 0:2000 /system/bin/app_process32_original
chmod 755 /system/bin/app_process32_original
chcon u:object_r:zygote_exec:s0 /system/bin/app_process32_original

chown 0:0 /system/lib/libsupol.so
chmod 644 /system/lib/libsupol.so
chcon u:object_r:system_file:s0 /system/lib/libsupol.so

chown 0:0 /system/etc/install-recovery.sh
chmod 755 /system/etc/install-recovery.sh
chcon u:object_r:system_file:s0 /system/etc/install-recovery.sh

chown 0:0 /system/bin/install-recovery_original.sh
chmod 755 /system/bin/install-recovery_original.sh
chcon u:object_r:system_file:s0 /system/bin/install-recovery_original.sh

chown 0:0 /system/etc/.installed_su_daemon
chmod 644 /system/etc/.installed_su_daemon
chcon u:object_r:system_file:s0 /system/etc/.installed_su_daemon

chown 0:0 /system/app/SuperSU
chmod 755 /system/app/SuperSU
chcon u:object_r:system_file:s0 /system/app/SuperSU

chown 0:0 /system/app/SuperSU/SuperSU.apk
chmod 644 /system/app/SuperSU/SuperSU.apk
chcon u:object_r:system_file:s0 /system/app/SuperSU/SuperSU.apk

ln -s /system/etc/install-recovery.sh /system/bin/install-recovery.sh
ln -s /system/xbin/daemonsu /system/bin/app_process
ln -s /system/xbin/daemonsu /system/bin/app_process32

/system/xbin/su --install

chown 0:0 /system/xbin/busybox
chmod 755 /system/xbin/busybox
chcon u:object_r:system_file:s0 /system/xbin/busybox

/system/xbin/busybox --install -s /system/xbin

sync
