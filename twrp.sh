#!/bin/bash

# WARNING: This will remove all local changes!
rm -rf .repo/local_manifests
rm -rf kernel/sony
rm -rf device/sony
rm -rf hardware/sony
rm -rf vendor/sony

# Initialize repo
repo init -u https://github.com/SHRP/manifest.git -b shrp-12.1

# Sync the repositories
/opt/crave/resync.sh
/opt/crave/resync.sh
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# Clone device tree
git clone https://github.com/Sorayukii/stardust_kernel_sony_sdm845 -b stock kernel/sony/sdm845
git clone https://github.com/Sorayukii/android_device_sony_akatsuki -b 15 device/sony/akatsuki
git clone https://github.com/Sorayukii/android_device_sony_tama-common -b 15 device/sony/tama-common
git clone https://github.com/Sorayukii/android_hardware_sony_SonyOpenTelephony -b 15 hardware/sony/SonyOpenTelephony
git clone https://github.com/Sorayukii/proprietary_vendor_sony_akatsuki -b 15 vendor/sony/akatsuki
git clone https://github.com/Sorayukii/proprietary_vendor_sony_tama-common -b 15 vendor/sony/tama-common

# Export
export ALLOW_MISSING_DEPENDENCIES=true;
export SHRP_MAINTAINER= makeroot911;


# Set up build environment
source build/envsetup.sh

# Build rom
lunch twrp_akatsuki-eng

