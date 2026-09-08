#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Per-device wrapper: regenerates the common + this device's vendor
# makefiles (no firmware dump needed).

set -e

export DEVICE=udon
export DEVICE_COMMON=sm8475-common
export VENDOR=oneplus

# Fall back to the sm8450-common twin if only that one is synced.
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ ! -f "$HERE/../../${VENDOR}/${DEVICE_COMMON}/setup-makefiles.sh" ] && \
   [ -f "$HERE/../../${VENDOR}/sm8450-common/setup-makefiles.sh" ]; then
    DEVICE_COMMON=sm8450-common
fi

"$(cd "$HERE/../../${VENDOR}/${DEVICE_COMMON}" && pwd)/setup-makefiles.sh"
