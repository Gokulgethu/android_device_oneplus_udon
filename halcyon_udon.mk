#
# Copyright (C) 2026 The Halcyon Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Halcyon stuff.
$(call inherit-product, vendor/halcyon/config/common.mk)

# Inherit from udon device
$(call inherit-product, device/oneplus/udon/device.mk)

PRODUCT_NAME := halcyon_udon
PRODUCT_DEVICE := udon
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := CPH2487

PRODUCT_SYSTEM_NAME := CPH2487
PRODUCT_SYSTEM_DEVICE := OP5961L1

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="CPH2487-user 16 UKQ1.230917.001 1718152663000 release-keys" \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

BUILD_FINGERPRINT := OnePlus/CPH2487/OP5961L1:16/UKQ1.230917.001/1718152663000:user/release-keys
