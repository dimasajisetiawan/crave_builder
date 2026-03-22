#!/bin/bash

# WARNING: This will remove all local changes!
rm -rf .repo/local_manifests
rm -rf prebuilts/clang/host/linux-x86

# Initialize repo
repo init -u https://github.com/ProjectMatrixx/android.git -b 14.0 --git-lfs

# Clone device tree manifest
git clone https://github.com/Sorayukii/stardust_kernel_sony_sdm845 -b stock kernel/sony/sdm845
git clone https://github.com/sorayuki01/android_device_sony_akatsuki -b 14 device/sony/akatsuki
git clone https://github.com/sorayuki01/android_device_sony_tama-common -b 14 device/sony/tama-common
git clone https://github.com/sorayuki01/android_hardware_sony_SonyOpenTelephony -b lineage-21 hardware/sony/SonyOpenTelephony
git clone https://github.com/sorayuki01/proprietary_vendor_sony_akatsuki -b lineage-21 vendor/sony/akatsuki
git clone https://github.com/sorayuki01/proprietary_vendor_sony_tama-common -b 14 vendor/sony/tama-common
git clone https://github.com/sorayuki01/priv-keys -b master vendor/lineage-priv


# Sync the repositories
/opt/crave/resync.sh
/opt/crave/resync.sh
repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)

# Export
export BUILD_USERNAME=makeroot911
export BUILD_HOSTNAME=crave

# Set up build environment
source build/envsetup.sh

# Build rom
brunch akatsuki
