
#!/bin/bash

# repo init
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs

echo "========================================================================"
echo "REPO INITIALIZED"
echo "========================================================================"

# Clone repos
git clone https://github.com/peridot-dev/android_device_xiaomi_peridot.git -b lineage-23.0 device/xiaomi/peridot
git clone https://github.com/peridot-dev/proprietary_vendor_xiaomi_peridot.git -b lineage-23.0 vendor/xiaomi/peridot
git clone https://github.com/peridot-dev/android_kernel_xiaomi_sm8635.git -b lineage-23.0 device/xiaomi/kernel
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
. build/envsetup.sh
lunch lineage_peridot-bp2a-user
m evolution
TARGET_OPTIMIZED_DEXOPT := true


echo "========================================================================"
echo "BUILD COMPLETE"
echo "========================================================================"
