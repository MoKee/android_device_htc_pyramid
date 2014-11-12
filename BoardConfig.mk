# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

LOCAL_PATH := device/htc/pyramid

# Bootloader
BOARD_VENDOR := htc
TARGET_BOOTLOADER_BOARD_NAME := pyramid
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := scorpion
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Filesystem
BOARD_VOLD_MAX_PARTITIONS := 36
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838859776
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1252770816
BOARD_FLASH_BLOCK_SIZE := 262144

# Kernel
TARGET_KERNEL_SOURCE := kernel/htc/pyramid
BOARD_KERNEL_BASE := 0x48000000
BOARD_KERNEL_PAGE_SIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0 androidboot.hardware=pyramid no_console_suspend=1
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01400000
TARGET_KERNEL_CONFIG := slim-pyramid_defconfig

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.pyramid
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
RECOVERY_GRAPHICS_USE_LINELENGTH := true

# QCOM hardware
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
BOARD_USES_QCOM_HARDWARE := true
TARGET_QCOM_DISPLAY_VARIANT := caf
TARGET_QCOM_MEDIA_VARIANT := caf
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

# Camera
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
COMMON_GLOBAL_CFLAGS += -DHTC_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
USE_DEVICE_SPECIFIC_CAMERA := true

# Audio
COMMON_GLOBAL_CFLAGS += -DHTC_ACOUSTIC_AUDIO -DLEGACY_QCOM_VOICE
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_QCOM_TUNNEL_LPA_ENABLED := true
BOARD_QCOM_VOIP_ENABLED := true

# Graphics
USE_OPENGL_RENDERER := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
TARGET_DISPLAY_INSECURE_MM_HEAP := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := pyramid
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# RIL
BOARD_USES_LEGACY_RIL := true
BOARD_USE_NEW_LIBRIL_HTC := true

# Charge mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode

# Use CM PowerHAL
TARGET_POWERHAL_VARIANT := cm

# Lights
TARGET_PROVIDES_LIBLIGHT := true
TARGET_HAS_NO_BLUE_LED := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth/include
BOARD_BLUEDROID_VENDOR_CONF := $(LOCAL_PATH)/bluetooth/vnd_pyramid.txt
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false

# WiFi
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_BAND := 802_11_ABG
WIFI_DRIVER_FW_PATH_STA := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Boot-animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

# Hardware tunables
BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/mkhw/

# Misc
COMMON_GLOBAL_CFLAGS += -DHTCLOG

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/sepolicy

BOARD_SEPOLICY_UNION += \
    app.te \
    bluetooth.te \
    device.te \
    domain.te \
    drmserver.te \
    file_contexts \
    file.te \
    hci_init.te \
    healthd.te \
    init_shell.te \
    init.te \
    keystore.te \
    kickstart.te \
    mediaserver.te \
    rild.te \
    surfaceflinger.te \
    system.te \
    ueventd.te \
    wpa_socket.te \
    wpa.te