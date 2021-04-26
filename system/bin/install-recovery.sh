#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11177984 0fe99d8e13454644f3974d5c0b0878e48235154e 8060928 e70a9b050011799872d788ddfd732db386f3dd59
fi
if ! applypatch -c EMMC:/dev/block/platform/sprd-sdhci.3/by-name/RECOVERY:11177984:0fe99d8e13454644f3974d5c0b0878e48235154e; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/sprd-sdhci.3/by-name/KERNEL:8060928:e70a9b050011799872d788ddfd732db386f3dd59 EMMC:/dev/block/platform/sprd-sdhci.3/by-name/RECOVERY 0fe99d8e13454644f3974d5c0b0878e48235154e 11177984 e70a9b050011799872d788ddfd732db386f3dd59:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
