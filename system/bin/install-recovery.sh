#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:12789760:6fface4219fceccf7d37e8cca226216cd8f3e002; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:12388352:2801ba3397e1c1643271069d4bfc65c1d3b3d844 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 6fface4219fceccf7d37e8cca226216cd8f3e002 12789760 2801ba3397e1c1643271069d4bfc65c1d3b3d844:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
