#
# SM-N980F (c1s) - unified universal9830 fragment
#

DEVICE_FRAGMENT_PATH := device/samsung/universal9830/devices/c1s

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c1s/mixer_paths.xml

# Display
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/configs/display/display_id_4633128672291735937.xml:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c1s/displayconfig/display_id_4633128672291735937.xml

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c1s/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_FRAGMENT_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c1s/wifi/wpa_supplicant_overlay.conf

# Runtime detection data
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/vendor.prop:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c1s/vendor.prop \
    $(DEVICE_FRAGMENT_PATH)/overlays.txt:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c1s/overlays.txt \
    $(DEVICE_FRAGMENT_PATH)/density:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c1s/density \
    $(DEVICE_FRAGMENT_PATH)/family:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c1s/family

# RRO overlays (enabled at runtime by universal9830-detect)
PRODUCT_PACKAGES += \
    FrameworkResOverlayDeviceC1s \
    SettingsProviderOverlayDeviceC1s \
    SystemUIOverlayDeviceC1s \
    WiFiOverlayDeviceC1s
