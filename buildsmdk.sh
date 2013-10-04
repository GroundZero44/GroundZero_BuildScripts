#!/bin/bash
#
# LiquidSmooth Buildbot v1.0
#
# By: Shane Faulkner
# http://shanefaulkner.com
#

#----------------------Settings Reset----------------------#

PRODUCT=()
LUNCHCD=()

#----------------------Default Paths-----------------------#

# your build source code directory path
SAUCE="/home/liquid/android/liquid"

# your build storage location directory
STORAGE="/home/liquid/Desktop/builds"

#--------------------Default Settings----------------------#

# your package name and version number
VERSION="Liquid-JB-v2.8-OFFICIAL"

#--------------------Default Products----------------------#

PRODUCT[1]="i9300"
LUNCHCD[1]="liquid_i9300-userdebug"

PRODUCT[2]="i605"
LUNCHCD[2]="liquid_i605-userdebug"

PRODUCT[3]="l900"
LUNCHCD[3]="liquid_l900-userdebug"

PRODUCT[4]="n7100"
LUNCHCD[4]="liquid_n7100-userdebug"

PRODUCT[5]="t0lte"
LUNCHCD[5]="liquid_t0lte-userdebug"

#---------------------Buildbot Code------------------------#

for VAL in "${!PRODUCT[@]}"
do
        echo "Starting build..."
        source build/envsetup.sh && lunch ${LUNCHCD[$VAL]} && time mka liquid
        cp "$SAUCE/out/target/product/${PRODUCT[$VAL]}/$VERSION-${PRODUCT[$VAL]}.zip" "$STORAGE/$VERSION-${PRODUCT[$VAL]}.zip"
        echo "Build complete!"
done

