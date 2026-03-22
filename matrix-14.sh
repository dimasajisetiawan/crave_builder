#!/bin/bash

# WARNING: This will remove all local changes!
rm -rf .repo/local_manifests
rm -rf prebuilts/clang/host/linux-x86

# Initialize repo
repo init -u https://github.com/ProjectMatrixx/android.git -b 14.0 --git-lfs

# Clone device tree manifest
git clone https://github.com/dimasajisetiawan/local_manifests -b los_a14 .repo/local_manifests

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
