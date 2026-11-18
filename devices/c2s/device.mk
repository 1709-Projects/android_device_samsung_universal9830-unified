#
# SM-N986B (c2s) - unified universal9830 fragment
#

DEVICE_FRAGMENT_PATH := device/samsung/universal9830/devices/c2s

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c2s/mixer_paths.xml

# Display
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/configs/display/display_id_4633128672291735937.xml:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c2s/displayconfig/display_id_4633128672291735937.xml

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c2s/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_FRAGMENT_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c2s/wifi/wpa_supplicant_overlay.conf

# UWB
PRODUCT_PACKAGES += \
    libuwb-countrycode.conf \
    libuwb-nxp.conf \
    libuwb-uci.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.uwb.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.uwb.xml

# Runtime detection data
PRODUCT_COPY_FILES += \
    $(DEVICE_FRAGMENT_PATH)/vendor.prop:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c2s/vendor.prop \
    $(DEVICE_FRAGMENT_PATH)/overlays.txt:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c2s/overlays.txt \
    $(DEVICE_FRAGMENT_PATH)/density:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c2s/density \
    $(DEVICE_FRAGMENT_PATH)/family:$(TARGET_COPY_OUT_VENDOR)/etc/universal9830/c2s/family

# RRO overlays (enabled at runtime by universal9830-detect)
PRODUCT_PACKAGES += \
    ApertureOverlayDeviceC2s \
    FrameworkResOverlayDeviceC2s \
    SettingsProviderOverlayDeviceC2s \
    SystemUIOverlayDeviceC2s \
    WiFiOverlayDeviceC2s
