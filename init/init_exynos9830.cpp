/*
 * Copyright (C) 2021-2026 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
*/

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>
#include <android-base/properties.h>
#include <android-base/logging.h>
#include <fstream>
#include <map>
#include <string>
#include <vector>

#include "property_service.h"
#include "vendor_init.h"

using android::base::GetProperty;
using std::string;

std::vector<string> ro_props_default_source_order = {
    "",
    "odm.",
    "product.",
    "system.",
    "system_ext.",
    "vendor.",
};

/*
 * Model prefix -> internal codename. Every supported device is built from the
 * same unified image and reports itself as "Samsung Universal9830"; the real
 * codename is only used to select the matching device configuration.
 */
static const std::map<string, string> kModelToCodename = {
    {"SM-G981", "x1s"},   // Galaxy S20 5G
    {"SM-G986", "y2s"},   // Galaxy S20+
    {"SM-G988", "z3s"},   // Galaxy S20 Ultra
    {"SM-G780", "r8s"},   // Galaxy S20 FE
    {"SM-N980", "c1s"},   // Galaxy Note20
    {"SM-N986", "c2s"},   // Galaxy Note20 Ultra
};

void property_override(string prop, string value) {
    auto pi = (prop_info*) __system_property_find(prop.c_str());

    if (pi != nullptr)
        __system_property_update(pi, value.c_str(), value.size());
    else
        __system_property_add(prop.c_str(), prop.size(), value.c_str(), value.size());
}

void set_ro_build_prop(const string &prop, const string &value, bool product = true) {
    string prop_name;

    for (const auto &source : ro_props_default_source_order) {
        if (product)
            prop_name = "ro.product." + source + prop;
        else
            prop_name = "ro." + source + "build." + prop;

        property_override(prop_name.c_str(), value.c_str());
    }
}

static string detect_codename() {
    string model = GetProperty("ro.boot.product.model", "");
    if (model.empty())
        model = GetProperty("ro.boot.em.model", "");

    for (const auto &entry : kModelToCodename) {
        if (model.rfind(entry.first, 0) == 0)
            return entry.second;
    }

    LOG(WARNING) << "universal9830: unknown model '" << model << "', using defaults";
    return "universal9830";
}

static void apply_prop_file(const string &path) {
    std::ifstream file(path);
    string line;

    if (!file.is_open()) {
        LOG(WARNING) << "universal9830: cannot open " << path;
        return;
    }

    while (std::getline(file, line)) {
        if (line.empty() || line[0] == '#')
            continue;

        auto pos = line.find('=');
        if (pos == string::npos)
            continue;

        string key = line.substr(0, pos);
        string value = line.substr(pos + 1);
        property_override(key, value);
    }
}

void vendor_load_properties() {
    string codename = detect_codename();

    /* The phone always identifies itself as Samsung Universal9830 */
    set_ro_build_prop("device", "universal9830");
    set_ro_build_prop("name", "universal9830");
    set_ro_build_prop("model", "Universal9830");
    set_ro_build_prop("brand", "samsung");
    set_ro_build_prop("manufacturer", "Samsung");

    /* Internal codename used by /vendor/bin/universal9830-detect */
    property_override("ro.vendor.device.codename", codename);
    property_override("ro.vendor.universal9830.device", codename);

    /* Per-device vendor properties (fingerprint, BT name, Wi-Fi, NFC, ...) */
    apply_prop_file("/vendor/etc/universal9830/" + codename + "/vendor.prop");
}
