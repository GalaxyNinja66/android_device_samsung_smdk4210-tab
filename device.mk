#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)
$(call inherit-product-if-exists, vendor/samsung/smdk4210-tab/vendor.mk)

# exclude live wallpapers
TARGET_EXCLUDE_LIVEWALLPAPERS := true

# include a bunch of resources
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_LOCALES += xhdpi

# rootdir files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.smdk4210.rc:root/init.smdk4210.rc \
    $(LOCAL_PATH)/rootdir/init.smdk4210.bt.rc:root/init.smdk4210.bt.rc \
    $(LOCAL_PATH)/rootdir/init.smdk4210.usb.rc:root/init.smdk4210.usb.rc \
    $(LOCAL_PATH)/rootdir/fstab.smdk4210:root/fstab.smdk4210 \
    $(LOCAL_PATH)/rootdir/ueventd.smdk4210.rc:root/ueventd.smdk4210.rc

# recovery rootdir
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.recovery.smdk4210.rc:root/init.recovery.smdk4210.rc

# Audio @daniel, move here
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/tinyalsa-audio.xml:system/etc/tinyalsa-audio.xml \
    $(LOCAL_PATH)/configs/etc/audio_policy.conf:system/etc/audio_policy.conf

# Bluetooth configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/init.bt.sh:system/etc/init.bt.sh \
    $(LOCAL_PATH)/configs/etc/PSConfig_8811.psr:system/etc/PSConfig_8811.psr

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/wifi/p2p_supplicant.conf:system/etc/wifi/p2p_supplicant.conf \
    $(LOCAL_PATH)/configs/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=80

# PerformanceControl defaults
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/01PCdefaults:system/etc/init.d/01PCdefaults

# Netflix hack
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/98netflix:system/etc/init.d/98netflix

# Packages
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    librs_jni \
    libsurfaceflinger_client \
    libwpa_client \
    PerformanceControl \
    wpa_supplicant \
    wpa_supplicant.conf \
    macloader 

# Bluetooth Bluez
PRODUCT_PACKAGES += \
    haltest \
    hciattach \
    hciconfig \
    hcitool \
    bccmd

# HAL
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.exynos4 \
    audio.sco.default \
    audio.usb.default \
    camera.smdk4210 \
    gralloc.exynos4 \
    hwcomposer.exynos4 \
    lights.exynos4 \
    libhwconverter \
    libs5pjpeg \
    libfimg \
    libnetcmdiface \
    consumerir.exynos4

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# MFC API
PRODUCT_PACKAGES += \
    libsecmfcapi



# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs \
    static_busybox

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

# modified keylayout for keyboard dock
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/usr/keylayout/sec_keyboard.kl:system/usr/keylayout/sec_keyboard.kl

PRODUCT_PACKAGES += \
    sec_keyboard

PRODUCT_CHARACTERISTICS := tablet

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enable=true \

# ADB
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.adb.secure=0


# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.zygote.disable_gl_preload=true \
    ro.zygote=zygote32 \
    ro.bq.gpu_to_cpu_unsupported=1 \
    debug.hwui.render_dirty_regions=false \
    persist.panel.orientation=270

PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    persist.sys.isUsbOtgEnabled=true \
    persist.sys.root_access=3


# OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libseccscapi \
    libsecbasecomponent \
    libsecosal \
    libSEC_OMX_Resourcemanager \
    libSEC_OMX_Core \
    libSEC_OMX_Vdec \
    libOMX.SEC.AVC.Decoder \
    libOMX.SEC.M4V.Decoder \
    libOMX.SEC.WMV.Decoder \
    libOMX.SEC.AVC.Encoder \
    libSEC_OMX_Venc \
    libOMX.SEC.M4V.Encoder

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/etc/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml
#    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Netflix hack
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

    

# Low RAM
TARGET_BOOTANIMATION_TEXTURE_CACHE := false

PRODUCT_PROPERTY_OVERRIDES += \
    config.disable_atlas=true \
    persist.sys.purgeable_assets=1 \
    persist.sys.force_highendgfx=true \
    persist.sys.prefer_16bpp=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true 		# w/o: 250MB RAM
    dalvik.vm.jit.codecachesize=0 \
    ro.sys.fw.bg_apps_limit=3 \ # Reduce background apps limit on low-tier devices
    ro.config.max_starting_bg=3  # Set max background services


# Extended JNI checks
PRODUCT_PROPERTY_OVERRIDES += \
   ro.kernel.android.checkjni=0 \
   dalvik.vm.checkjni=false \
   ro.kernel.checkjni=0

PRODUCT_PROPERTY_OVERRIDES += \
   ro.HOME_APP_ADJ=1 \
   ro.config.hw_quickpoweron=true \
   persist.android.strictmode=0

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.image-dex2oat-Xms=64m \
    dalvik.vm.image-dex2oat-Xmx=64m \
    dalvik.vm.dex2oat-Xms=64m \
    dalvik.vm.dex2oat-Xmx=512m \
    dalvik.vm.dex2oat-filter=interpret-only \
    dalvik.vm.image-dex2oat-filter=speed \
    ro.dalvik.vm.native.bridge=0 \
    dalvik.vm.lockprof.threshold=500 \
#    dalvik.vm.dexopt-data-only=1 \
#    dalvik.vm.usejit=true \
#    dalvik.vm.usejitprofiles=true \
#    dalvik.vm.execution-mode=int:jit \
#    dalvik.vm.appimageformat=lz4 \
#    debug.atrace.tags.enableflags=0
#    dalvik.vm.dex2oat-flags=--no-watch-dog
#    dalvik.vm.dexopt-flags=v=n,o=a,u=y \
#    davlik.vm.verify-bytecode=false

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
pm.dexopt.first-boot=interpret-only \
pm.dexopt.boot=verify-profile \
pm.dexopt.install=interpret-only \
pm.dexopt.bg-dexopt=speed-profile \
pm.dexopt.ab-ota=speed-profile \
pm.dexopt.nsys-library=speed \
pm.dexopt.shared-apk=speed \
pm.dexopt.forced-dexopt=speed \
pm.dexopt.core-app=speed


# sleep
#PRODUCT_PROPERTY_OVERRIDES += \
#power.saving.mode=1 \
#ro.config.hw_power_saving=true

# ART
#PRODUCT_DEX_PREOPT_DEFAULT_FLAGS := \
#    --compiler-filter=interpret-only
#$(call add-product-dex-preopt-module-config,services,--compiler-filter=speed)

# Force dex2oat to not use swap file
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false

# Media
#PRODUCT_PROPERTY_OVERRIDES += \
#    persist.sys.media.legacy-drm=1 \
#    media.stagefright.use-awesome=true \
#    persist.sys.NV_FPSLIMIT=60  \

#$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=48m \
    dalvik.vm.startheapsize=48m \
    dalvik.vm.heapgrowthlimit=64m \
    dalvik.vm.heapsize=174m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=2m


#streakOwner's recommended
#dalvik.vm.dexopt-flags=v=n,o=v
#dalvik.vm.dexopt-data-only=1

#PRODUCT_PROPERTY_OVERRIDES += \
#	pm.sleep_mode=1 \
#	wifi.supplicant_scan_interval=180

#PRODUCT_PROPERTY_OVERRIDES += \
#	media.stagefright.enable-player=true \
#	media.stagefright.enable-meta=true \
#	media.stagefright.enable-scan=true \
#	media.stagefright.enable-http=true \
#	media.stagefright.enable-rtsp=true \
#	media.stagefright.enable-record=false

PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.hw=1 \
	debug.performance.tuning=1
  




# Include exynos4 platform specific parts
TARGET_HAL_PATH := hardware/samsung/exynos4/hal
TARGET_OMX_PATH := hardware/samsung/exynos/multimedia/openmax
