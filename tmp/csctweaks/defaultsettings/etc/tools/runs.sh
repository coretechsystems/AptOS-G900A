#!/sbin/sh
# /sbin/mount -a
busybox mount -o rw,remount /system
#add extra toggles on boot
if [ -e /data/data/com.android.providers.settings/databases/settings.db ]; 
 	then
 	/system/etc/tools/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "update system set value='Torch/index2;' where name='toolbox_apps'";
fi
if [ -e /data/data/com.android.providers.settings/databases/settings.db ]; 
 	then
 	/system/etc/tools/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "update secure set value='1' where name='install_non_market_apps'";
fi
if [ -e /data/data/com.android.providers.settings/databases/settings.db ]; 
 	then
 	/system/etc/tools/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "update secure set value='1' where name='lock_screen_allow_private_notifications'";
fi;

echo "#!/system/bin/sh" > /system/etc/init.d/97settings
echo "" >> /system/etc/init.d/97settings
echo "sh /system/etc/tools/runsremove.sh" >> /system/etc/init.d/97settings
echo "" >> /system/etc/init.d/97settings

chown 0:0 /system/etc/init.d/*
chmod 777 /system/etc/init.d/*
chcon u:object_r:system_file:s0 /system/etc/init.d/*

busybox mount -o ro,remount /system
