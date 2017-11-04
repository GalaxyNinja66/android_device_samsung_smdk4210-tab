#
# Copyright (C) 2015 The CyanogenMod Project
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
$(call inherit-product-if-exists, vendor/samsung/smdk4210-tab/vendor.mk)

# include a bunch of resources
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_LOCALES += xhdpi

# rootdir files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.smdk4210.bt.rc:root/init.smdk4210.bt.rc \
    $(LOCAL_PATH)/rootdir/init.smdk4210.usb.rc:root/init.smdk4210.usb.rc \
    $(LOCAL_PATH)/rootdir/fstab.smdk4210:root/fstab.smdk4210 \
    $(LOCAL_PATH)/rootdir/ueventd.smdk4210.rc:root/ueventd.smdk4210.rc

# recovery rootdir
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.recovery.smdk4210.rc:root/init.recovery.smdk4210.rc

# codecs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/etc/media_profiles.xml:system/etc/media_profiles.xml \
    hardware/samsung/exynos3/s5pc110/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml



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
    wifi.supplicant_scan_interval=80 \
    ro.disableWifiApFirmwareReload=true


# PerformanceControl defaults
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/00PCdefaults:system/etc/init.d/00PCdefaults

# Fix Gapps permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/99zApkPermissions:system/etc/init.d/99zApkPermissions

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
    libstlport \
    libfimg \
    libnetcmdiface \
    power.exynos4 \
    consumerir.exynos4

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# MFC API
PRODUCT_PACKAGES += \
    libsecmfcapi

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
    libSEC_OMX_Venc \
    libOMX.SEC.AVC.Encoder \
    libOMX.SEC.M4V.Encoder \

# Filesystem management tools
PRODUCT_PACKAGES += \
    fsck.f2fs \
    mkfs.f2fs \
    make_ext4fs \
    setup_fs \

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
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

# modified keylayout for keyboard dock
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/usr/keylayout/sec_keyboard.kl:system/usr/keylayout/sec_keyboard.kl

PRODUCT_PACKAGES += \
    sec_keyboard

PRODUCT_CHARACTERISTICS := tablet

# BlueZ Customization
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.bluetooth.handsfree=hfp

# disable Captive portal check
PRODUCT_PROPERTY_OVERRIDES += \
    ro.disable_captive_portal=1

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version= 131072 \
    hwui.render_dirty_regions=false \
    ro.bq.gpu_to_cpu_unsupported=1 \
    drm.service.enable=true \
    persist.panel.orientation=270 \
    ro.hwui.disable_scissor_opt=true \
    ro.zygote.disable_gl_preload=true \

# Graphics
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.zygote.disable_gl_preload=true \
#    ro.opengles.version=196609 \
#    hwui.render_dirty_regions=false \
#    ro.bq.gpu_to_cpu_unsupported=1 \
#    drm.service.enable=true \
#    persist.panel.orientation=270

# Surface
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=202

# Gello Browser
PRODUCT_PACKAGES += \
	Gello


PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    persist.sys.root_access=3

# Feature live wallpaper
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers

$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# Include exynos4 platform specific parts
TARGET_HAL_PATH := hardware/samsung/exynos4/hal
TARGET_OMX_PATH := hardware/samsung/exynos/multimedia/openmax



# Services
PRODUCT_PROPERTY_OVERRIDES += \
    config.disable_atlas=true

# Low RAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true \
    ro.sys.fw.bg_apps_limit=12 \
    ro.config.max_starting_bg=8 \
    dalvik.vm.jit.codecachesize=0



# Extended JNI checks
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false


# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-Xms=8m \
    dalvik.vm.dex2oat-Xmx=96m \
    dalvik.vm.image-dex2oat-Xms=48m \
    dalvik.vm.image-dex2oat-Xmx=48m \
    dalvik.vm.dex2oat-flags=--no-watch-dog \
    dalvik.vm.dex2oat-filter=interpret-only \
    dalvik.vm.image-dex2oat-filter=speed \
    dalvik.vm.dexopt-flag=o=y,m=y

# Dalvik
#PRODUCT_PROPERTY_OVERRIDES += \
#    dalvik.vm.debug.alloc=0 \
#    dalvik.vm.heapstartsize=5m \
#    dalvik.vm.heapgrowthlimit=48m \
#    dalvik.vm.heapsize=128m \
#    dalvik.vm.heaptargetutilization=0.75 \
#    dalvik.vm.heaputilization=0.25 \
#    dalvik.vm.heapminfree=512k \
#    dalvik.vm.heapmaxfree=2m \
#    dalvik.vm.lockprof.threshold=500 \
#    dalvik.vm.dexopt-flags=o=y,m=y,v=n \
#    dalvik.vm.execution-mode=int:jit \
#    dalvik.vm.verify-bytecode=true \
#    dalvik.vm.jmiopts=forcecopy \
#    persist.sys.dalvik.vm.lib=libdvm.so \
#    dalvik.vm.stack-trace-file=/data/anr/traces.txt

# Force dex2oat to not use swap file
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false
 

# Article on Heap sizes
# https://01.org/android-ia/user-guides/android-memory-tuning-android-5.0-and-5.1
#
# Davlik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=64m \
    dalvik.vm.heapsize=320m \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=4m



# Juwe11 script for tweaking
#PRODUCT_PROPERTY_OVERRIDES += \
#    vm.swappiness=50 \
#    vm.vfs_cache_pressure=10 \
#    vm.dirty_expire_centisecs=500 \
#    vm.dirty_writeback_centisecs=1000 \
#    vm.dirty_ratio=90 \
#    vm.dirty_backgroud_ratio=5

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.media.legacy-drm=1 \
    media.stagefright.use-awesome=true \
    persist.sys.NV_FPSLIMIT=60  \

#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.max.fling_velocity=12000 \ 
#    ro.min.fling_velocity=8000 \
#    ro.secure=0 \
#    persist.sys.purgeable_assets=1 \ 
#    persist.sys.use_dithering=1 \
#    persist.sys.NV_FPSLIMIT=60 \
#    debug.performance.tuning=1 \
#    debug.kill_allocating_task=0 \
#    windowsmgr.max_events_per_sec=84 \


#PRODUCT_PROPERTY_OVERRIDES += \
#    persist.service.pcsync.enable=0 \
#    persist.service.lgospd.enable=0 \
#    ro.config.hw_quickpoweron=true \
#    windowsmgr.max_events_per_sec=150 \
#    pm.sleep_mode=1 \

# ART
#PRODUCT_DEX_PREOPT_DEFAULT_FLAGS := \
#    --compiler-filter=interpret-only

# Decrease boot time
#PRODUCT_PROPERTY_OVERRIDES := \ 
#    persist.sys.shutdown.mode=hibernate \
#    dev.bootcomplete=0


# Render UI with GPU
#PRODUCT_PROPERTY_OVERRIDES := \
#    debug.sf.hw=1





