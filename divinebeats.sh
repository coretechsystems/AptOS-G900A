#!/sbin/sh
if [ "`grep divine.beats.activated=true /system/build.prop`" ]; 
then
   :
elif [ -e /system/framework/SemcGenericUxpRes/SemcGenericUxpRes.apk ];
then
   :
elif [ "`grep ro.build.version.sdk=19 /system/build.prop`" ]; 
then
   :
else 
   cp -f /tmp/DBFiles/lib/* /system/lib/
   cp -f /tmp/DBFiles/framework/* /system/framework/
   mkdir -p /system/etc/audio/algorithm
   cp -f /tmp/DBFiles/etc/audio/algorithm/* /system/etc/audio/algorithm/
fi

