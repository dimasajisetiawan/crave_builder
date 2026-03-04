mkdir ~/OrangeFox_sync
cd ~/OrangeFox_sync
git clone https://gitlab.com/OrangeFox/sync.git
cd ~/OrangeFox_sync/sync/
./orangefox_sync.sh --branch 12.1 --path ~/fox_12.1
cd ~/fox_12.1
git clone https://github.com/j4nn/android_device_sony_tama.git -b android-12.1 device/sony/tama
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_BUILD_DEVICE=akatsuki
export LC_ALL="C"
source build/envsetup.sh
lunch twrp_akatsuki-eng && mka adbd bootimage
