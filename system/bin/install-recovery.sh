#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:12822528:dfc3a4b24a54fc5cb7bb644bd8bfcf82976b0991; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:12419072:c2a2b36f0376a8c4493b47890abb1ce5c04e82ca EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery dfc3a4b24a54fc5cb7bb644bd8bfcf82976b0991 12822528 c2a2b36f0376a8c4493b47890abb1ce5c04e82ca:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
