#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:12787712:7e3690391893aa52207c28908f3df6f1561cd017; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:12386304:1c6c6c1920e0d73649f3f33c5d47dfe0314a114b EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 7e3690391893aa52207c28908f3df6f1561cd017 12787712 1c6c6c1920e0d73649f3f33c5d47dfe0314a114b:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
