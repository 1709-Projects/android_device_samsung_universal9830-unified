#
# SM-G780F (r8s) - unified universal9830 fragment
#

DEVICE_FRAGMENT_PATH := device/samsung/universal9830/devices/r8s

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/r8s/mixer_paths.xml \
    $(DEVICE_FRAGMENT_PATH)/configs/audio/mixer_usb_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/r8s/mixer_usb_default.xml \
    $(DEVICE_FRAGMENT_PATH)/configs/audio/mixer_usb_gray.xml:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/r8s/mixer_usb_gray.xml

# Display
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/configs/display/display_id_4633128672291735937.xml:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/r8s/displayconfig/display_id_4633128672291735937.xml

# Sensors
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/r8s/sensors/hals.conf

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/r8s/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_FRAGMENT_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/r8s/wifi/wpa_supplicant_overlay.conf

# NFC
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/configs/nfc/libnfc-sec-vendor.conf:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/r8s/nfc/libnfc-sec-vendor.conf

# Wi-Fi MAC loader
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/macloader/macloader:$(TARGET_COPY_OUT_VENDOR)/bin/hw/macloader

# Runtime detection data
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/vendor.prop:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/r8s/vendor.prop \
    $(DEVICE_FRAGMENT_PATH)/overlays.txt:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/r8s/overlays.txt \
    $(DEVICE_FRAGMENT_PATH)/density:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/r8s/density \
    $(DEVICE_FRAGMENT_PATH)/family:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/r8s/family

# RRO overlays (enabled at runtime by universal9830-detect)
PRODUCT_PACKAGES += \
    ApertureOverlayDeviceR8s \
    FrameworkResOverlayDeviceR8s \
    SettingsOverlayDeviceR8s \
    SettingsProviderOverlayDeviceR8s \
    SystemUIOverlayDeviceR8s \
    WifiOverlayDeviceR8s
