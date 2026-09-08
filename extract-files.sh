#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Per-device wrapper: runs the common SM8475/SM8450 extraction for this
# device. The common tree owns the shared blob list and the makefile
# generator; this tree's own proprietary-files.txt is processed too, into
# vendor/oneplus/$DEVICE.

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=udon
export DEVICE_COMMON=sm8475-common
export VENDOR=oneplus

# Fall back to the sm8450-common twin if only that one is synced.
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ ! -f "$HERE/../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" ] && \
   [ -f "$HERE/../../${VENDOR}/sm8450-common/extract-files.sh" ]; then
    DEVICE_COMMON=sm8450-common
fi

"$(cd "$HERE/../../${VENDOR}/${DEVICE_COMMON}" && pwd)/extract-files.sh" "$@"
