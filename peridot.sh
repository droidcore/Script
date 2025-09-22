
#!/bin/bash

# repo init
repo init -u https://github.com/Lunaris-AOSP/android -b 16 --git-lfs

echo "========================================================================"
echo "REPO INITIALIZED"
echo "========================================================================"

# Clone repos
git clone https://github.com/ondrejnedoma/device_xiaomi_peridot.git -b 16.0 device/xiaomi/peridot
git clone https://github.com/GuidixX/vendor_xiaomi_peridot.git -b 16.0 vendor/xiaomi/peridot
git clone https://github.com/GuidixX/device_xiaomi_peridot-kernel.git -b 16.0 device/xiaomi/peridot-kernel
git clone https://github.com/ondrejnedoma/device_xiaomi_peridot-miuicamera.git -b fifteen device/xiaomi/peridot-miuicamera
git clone https://github.com/ondrejnedoma/vendor_xiaomi_peridot-miuicamera.git -b fifteen vendor/xiaomi/peridot-miuicamera
git clone https://github.com/VoltageOS/hardware_xiaomi.git -b 16 hardware/xiaomi

echo "========================================================================"
echo "CLONED REPOS"
echo "========================================================================"

# sync 
/opt/crave/resync.sh

echo "========================================================================"
echo "BUILDING........."
echo "========================================================================"

# lunaris
. b*/env*
lunch lineage_peridot-bp2a-user
m lunaris
mkdir release-files
cp -r out/target/product/peridot/Lunaris-AOSP* release-files/
lunch lineage_peridot-bp2a-user
WITH_GMS := true m lunaris
TARGET_USES_OMNI_GAPPS :=true
ro.paranoid.maintainer=BLU
TARGET_OPTIMIZED_DEXOPT := true
WITH_BCR := true


echo "========================================================================"
echo "BUILD COMPLETE"
echo "========================================================================"
