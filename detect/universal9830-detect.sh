#!/system/bin/sh
# Copyright (C) 2026 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#
# Runtime glue for the unified Exynos 9830 device tree.
# The product always identifies itself as "Samsung Universal9830"; the real
# codename (x1s/y2s/z3s/r8s/c1s/c2s) is exported as ro.vendor.device.codename
# and used to bind-mount the matching configuration files.

PATH=/system/bin:/vendor/bin
codename="$(getprop ro.vendor.device.codename)"
[ -z "$codename" ] && codename="universal9830"
D="/vendor/etc/universal9830/$codename"

log -p i -t universal9830 "detected device: $codename"

bind() {
    # $1 = file inside the per-device directory, $2 = final path
    [ -f "$D/$1" ] || return 0
    [ -e "$2" ] || return 0
    mount -o bind "$D/$1" "$2" 2>/dev/null
}

if [ "$1" = "early" ]; then
    bind mixer_paths.xml /vendor/etc/mixer_paths.xml
    bind displayconfig/display_id_4633128672291735937.xml /vendor/etc/displayconfig/display_id_4633128672291735937.xml
    bind sensors/hals.conf /vendor/etc/sensors/hals.conf
    bind wifi/p2p_supplicant_overlay.conf /vendor/etc/wifi/p2p_supplicant_overlay.conf
    bind wifi/wpa_supplicant_overlay.conf /vendor/etc/wifi/wpa_supplicant_overlay.conf
    bind nfc/libnfc-sec-vendor.conf /vendor/etc/libnfc-sec-vendor.conf
    [ -f "$D/macloader" ] && [ -e /vendor/bin/hw/macloader ] && \
        mount -o bind "$D/macloader" /vendor/bin/hw/macloader 2>/dev/null

    # Vendor blobs that differ between devices (same path, different content)
    if [ -f "$D/vendor-bind.txt" ]; then
        while read -r rel; do
            [ -z "$rel" ] && continue
            src="/vendor/universal9830/$codename/$rel"
            [ -e "$src" ] || continue
            [ -e "/$rel" ] || continue
            mount -o bind "$src" "/$rel" 2>/dev/null
        done < "$D/vendor-bind.txt"
    fi
    exit 0
fi

# --- late (sys.boot_completed) : density + per-device RROs ---
if [ -f "$D/density" ]; then
    wm density "$(cat "$D/density")"
    wm size reset
fi

for p in $(cat "$D/overlays.txt" 2>/dev/null); do
    cmd overlay enable --user 0 "$p" 2>/dev/null
done

family="$(cat "$D/family" 2>/dev/null)"
case "$family" in
    hubble) cmd overlay enable --user 0 android.overlay.hubble 2>/dev/null ;;
    canvas) cmd overlay enable --user 0 android.overlay.canvas 2>/dev/null ;;
esac

exit 0
