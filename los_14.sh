#!/bin/bash

# WARNING: This will remove all local changes!
rm -rf .repo/local_manifests
rm -rf kernel/sony
rm -rf device/sony
rm -rf hardware/sony
rm -rf vendor/sony
rm -rf vendor/lineage-priv

# Initialize repo
repo init -u https://github.com/LineageOS/android.git -b lineage-21.0 --git-lfs

# Sync the repositories
/opt/crave/resync.sh
/opt/crave/resync.sh
repo sync

# Clone device tree
git clone https://github.com/Sorayukii/stardust_kernel_sony_sdm845 -b stock kernel/sony/sdm845
git clone https://github.com/sorayuki01/android_device_sony_akatsuki -b 14 device/sony/akatsuki
git clone https://github.com/sorayuki01/android_device_sony_tama-common -b 14 device/sony/tama-common
git clone https://github.com/sorayuki01/android_hardware_sony_SonyOpenTelephony -b lineage-21 hardware/sony/SonyOpenTelephony
git clone https://github.com/sorayuki01/proprietary_vendor_sony_akatsuki -b lineage-21 vendor/sony/akatsuki
git clone https://github.com/sorayuki01/proprietary_vendor_sony_tama-common -b 14 vendor/sony/tama-common
git clone https://github.com/sorayuki01/priv-keys -b master vendor/lineage-priv


# Export
export BUILD_USERNAME=makeroot911
export BUILD_HOSTNAME=crave

# Set up build environment
source build/envsetup.sh

# Build rom
breakfast akatsuki userdebug;
mka bacon
# Upload rom
curl uploader.sh -T out/target/product/akatsuki/lineage*.zip
