#!/sbin/sh
# /sbin/mount -a
busybox mount -o rw,remount /system
#add extra toggles on boot
if [ -e /data/data/com.android.providers.settings/databases/settings.db ]; 
 	then
 	/system/etc/tools/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "update system set value='Wifi;MobileData;Location;SilentMode;AutoRotate;Bluetooth;DormantMode;PowerSaving;UltraPowerSaving;MultiWindow;SFinder;QuickConnect;AllShareCast;SBeam;Nfc;Toolbox;AirView;AirGesture;DrivingMode;CarMode;SmartStay;SmartPause;SmartScroll;Flashlight;AirplaneMode;NetworkBooster;TouchSensitivity;PersonalMode;Sync;WiFiHotspot;' where name='notification_panel_active_app_list'";
fi
if [ -e /data/data/com.android.providers.settings/databases/settings.db ]; 
	then
	/system/etc/tools/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "update system set value='Wifi;MobileData;Location;SilentMode;AutoRotate;Bluetooth;DormantMode;PowerSaving;UltraPowerSaving;MultiWindow;SFinder;QuickConnect;AllShareCast;SBeam;Nfc;Toolbox;AirView;AirGesture;DrivingMode;CarMode;SmartStay;SmartPause;SmartScroll;Flashlight;AirplaneMode;NetworkBooster;TouchSensitivity;PersonalMode;Sync;WiFiHotspot;' where name='notification_panel_active_app_list_for_reset'";
fi
if [ -e /data/data/com.android.providers.settings/databases/settings.db ]; 
 	then
	/system/etc/tools/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "update system set value='Wifi;MobileData;Data;Location;Bluetooth;SilentMode;Flashlight;Nfc;WiFiHotspot;AirplaneMode;CarMode;DormantMode;SBeam;PowerSaving;' where name='notification_panel_default_active_app_list'";
fi;

echo "#!/system/bin/sh" > /system/etc/init.d/99toggles
echo "" >> /system/etc/init.d/99toggles
echo "sh /system/etc/tools/runremove.sh" >> /system/etc/init.d/99toggles
echo "" >> /system/etc/init.d/99toggles

chown 0:0 /system/etc/init.d/*
chmod 777 /system/etc/init.d/*
chcon u:object_r:system_file:s0 /system/etc/init.d/*

busybox mount -o ro,remount /system
