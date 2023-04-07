#!/bin/bash
cd /tmp/rom

. build/envsetup.sh
export BUILD_USERNAME=zacky
export BUILD_HOSTNAME=android-build
export ALLOW_MISSING_DEPENDENCIES=true
export SELINUX_IGNORE_NEVERALLOWS=true
lunch aosp_whyred-userdebug
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z
mka bacon -j8 &
sleep 90m
kill %1
ccache -s

