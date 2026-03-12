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
git clone https://github.com/dimasajisetiawan/local_manifests -b los_14 .repo/local_manifests


# Export
export BUILD_USERNAME=makeroot911
export BUILD_HOSTNAME=crave

# Set up build environment
source build/envsetup.sh

# Build rom
brunch akatsuki

# Upload rom
curl uploader.sh -T out/target/product/akatsuki/lineage*.zip
