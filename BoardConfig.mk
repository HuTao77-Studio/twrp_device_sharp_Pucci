#
# Copyright (C) 2024 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/sharp/Pucci

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_SUPPRESS_SECURE_ERASE := true

# CPU
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_USES_64_BIT_BINDER := true

# GPT Utils
BOARD_PROVIDES_GPTUTILS := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm845
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Misc
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Storage
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true

# Platform
TARGET_BOARD_PLATFORM := sdm845
TARGET_BOARD_PLATFORM_GPU := qcom-adreno630
QCOM_BOARD_PLATFORMS += sdm845

# Kernel
BOARD_KERNEL_CMDLINE := \
	androidboot.configfs=true \
	androidboot.console=ttyMSM0 \
	androidboot.hardware=qcom \
	androidboot.selinux=permissive \
	console=ttyMSM0,115200n8 \
	earlycon=msm_geni_serial,0xA84000 \
	firmware_class.path=/vendor/firmware_mnt/image \
	loop.max_part=7 \
	lpm_levels.sleep_disabled=1 \
	msm_rtb.filter=0x237 ehci-hcd.park=3 \
	service_locator.enable=1 \
	swiotlb=2048 \
	video=vfb:640x400,bpp=32,memsize=3072000

BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := kernel/sharp/sdm845
TARGET_KERNEL_CONFIG := pucci_defconfig

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USERDATAIMAGE_PARTITION_SIZE := 50132250624
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_COPY_OUT_VENDOR := vendor

# Partitions (listed in the file) to be wiped under recovery.
TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/recovery.wipe
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Recovery
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USES_RECOVERY_AS_BOOT := true

TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# TWRP specific build flags
TW_THEME := portrait_hdpi
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_MAX_BRIGHTNESS := 1024
TW_DEFAULT_BRIGHTNESS := 225
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TW_NO_SCREEN_BLANK := true
TW_USE_TOOLBOX := true
TW_USE_LEDS_HAPTICS := true
TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_REPACKTOOLS := true
TW_HAS_EDL_MODE := true
TW_NO_USB_STORAGE := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_FUSE_NTFS := true

# Debug flags
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
