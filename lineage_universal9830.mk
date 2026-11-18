#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit from universal9830 device
$(call inherit-product, device/samsung/universal9830/device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := universal9830
PRODUCT_NAME := lineage_universal9830
PRODUCT_BRAND := samsung
PRODUCT_MODEL := Universal9830
PRODUCT_MANUFACTURER := Samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# Use the latest approved GMS identifiers (baseline: r8s)
PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceProduct=universal9830 \
    SystemName=universal9830 \
    BuildFingerprint=samsung/r8sxx/r8s:11/RP1A.200720.012/G780FXXSOFYJ1:user/release-keys \
    BuildDesc="r8sxx-user 11 RP1A.200720.012 G780FXXSOFYJ1 release-keys"

# Define PDA property for camera
PRODUCT_SYSTEM_PROPERTIES += \
    ro.build.PDA=G780FXXSOFYJ1
