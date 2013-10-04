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

PRODUCT[1]="grouper"
LUNCHCD[1]="liquid_grouper-userdebug"

PRODUCT[2]="maguro"
LUNCHCD[2]="liquid_maguro-userdebug"

PRODUCT[3]="mako"
LUNCHCD[3]="liquid_mako-userdebug"

PRODUCT[4]="manta"
LUNCHCD[4]="liquid_manta-userdebug"

PRODUCT[5]="toro"
LUNCHCD[5]="liquid_toro-userdebug"

#---------------------Buildbot Code------------------------#

for VAL in "${!PRODUCT[@]}"
do
        echo "Starting build..."
        source build/envsetup.sh && lunch ${LUNCHCD[$VAL]} && time mka liquid
        cp "$SAUCE/out/target/product/${PRODUCT[$VAL]}/$VERSION-${PRODUCT[$VAL]}.zip" "$STORAGE/$VERSION-${PRODUCT[$VAL]}.zip"
        echo "Build complete!"
done

