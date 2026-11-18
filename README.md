Unified device tree for the Samsung Exynos 9830 family
=======================================================

One image, one product (`lineage_universal9830`), for:

| Codename | Device | Model |
|----------|--------|-------|
| x1s | Galaxy S20 5G | SM-G981B |
| y2s | Galaxy S20+ | SM-G986B |
| z3s | Galaxy S20 Ultra | SM-G988B |
| r8s | Galaxy S20 FE | SM-G780F |
| c1s | Galaxy Note20 | SM-N980F |
| c2s | Galaxy Note20 Ultra | SM-N986B |

The phone always identifies itself as **Samsung Universal9830**.
The real codename is detected at boot from `ro.boot.em.model` and exposed as
`ro.vendor.device.codename`.

Layout
------
* `configs/` - shared configuration
* `devices/<codename>/` - per-device configs, props and RRO overlays
* `detect/` - runtime detection (bind mounts per-device configs, enables RROs)
* `init/` - libinit (identity + per-device property application)

Build
-----
```
source build/envsetup.sh
brunch universal9830
```
