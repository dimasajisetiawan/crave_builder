repo init -u https://github.com/SHRP/manifest.git -b shrp-12.1
/opt/crave/resync.sh
repo sync
git clone https://github.com/j4nn/android_device_sony_tama.git -b android-12.1 device/sony/tama
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh
lunch twrp_akatsuki-eng
mka bootimage
