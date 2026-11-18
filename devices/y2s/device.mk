#
# SM-G986B (y2s) - unified universal9830 fragment
#

DEVICE_FRAGMENT_PATH := device/samsung/universal9830/devices/y2s

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/y2s/mixer_paths.xml

# Display
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/configs/display/display_id_4633128672291735937.xml:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/y2s/displayconfig/display_id_4633128672291735937.xml

# Sensors
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/y2s/sensors/hals.conf

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/y2s/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_FRAGMENT_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/y2s/wifi/wpa_supplicant_overlay.conf

# Runtime detection data
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/vendor.prop:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/y2s/vendor.prop \
    $(DEVICE_FRAGMENT_PATH)/overlays.txt:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/y2s/overlays.txt \
    $(DEVICE_FRAGMENT_PATH)/density:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/y2s/density \
    $(DEVICE_FRAGMENT_PATH)/family:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/y2s/family

# RRO overlays (enabled at runtime by universal9830-detect)
PRODUCT_PACKAGES += \
    ApertureOverlayDeviceY2s \
    FrameworkResOverlayDeviceY2s \
    SettingsOverlayDeviceY2s \
    SettingsProviderOverlayDeviceY2s \
    SystemUIOverlayDeviceY2s \
    WiFiOverlayDeviceY2s
