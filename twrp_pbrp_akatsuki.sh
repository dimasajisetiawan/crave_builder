repo init -u https://github.com/PitchBlackRecoveryProject/manifest_pb -b android-12.1
/opt/crave/resync.sh
repo sync
git clone https://github.com/dimasajisetiawan/android_device_sony_tama -b android-12.1 device/sony/tama
patch -p1 < device/sony/tama/patches/vold-decryption-workaround-for-sodp-kernel.patch
patch -p1 < device/sony/tama/patches/0003-arm64-dts-sdm845-tama-common-LOS-dtbo-compatibility-.patch
patch -p1 < device/sony/tama/patches/0002-disable-skip_initramfs-option-to-allow-fastboot-boot.patch
source build/envsetup.sh
lunch twrp_akatsuki-eng
mka pbrp
