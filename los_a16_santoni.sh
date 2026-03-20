#!/bin/bash

# Initialize repo
repo init -u https://github.com/LineageOS/android.git -b lineage-23.2 --git-lfs

git clone https://github.com/dimasajisetiawan/local_manifests .repo/local_manifests

# Sync the repositories
/opt/crave/resync.sh
/opt/crave/resync.sh
repo sync

# Clone device tree



# Export
export BUILD_USERNAME=makeroot911
export BUILD_HOSTNAME=crave

# Set up build environment
source build/envsetup.sh
breakfast akatsuki userdebug;
mka bacon
# Build rom

# Upload rom
curl uploader.sh -T out/target/product/Mi8937/lineage*.zip
