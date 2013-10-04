#!/bin/bash
#
# LiquidSmooth Buildbot v1.1
#
# By: Shane Faulkner
# Edited: Sean Hoyt
# http://shanefaulkner.com
#

#----------------------Settings Reset----------------------#

PRODUCT=()
LUNCHCD=()

#----------------------Default Paths-----------------------#

# your build source code directory path
SAUCE="/home/teamliquid/2.10"

# your build storage location directory
STORAGE="/home/www/devs/teamliquid/Nightly"

#--------------------Default Settings----------------------#

# your package name and version number
VERSION="Liquid-JB-v2.10-Nightly"

#--------------------Default Products----------------------#

PRODUCT[1]="i9300"
LUNCHCD[1]="liquid_i9300-userdebug"

PRODUCT[2]="i9305"
LUNCHCD[2]="liquid_i9305-userdebug"

PRODUCT[3]="i605"
LUNCHCD[3]="liquid_i605-userdebug"

PRODUCT[4]="l900"
LUNCHCD[4]="liquid_l900-userdebug"

PRODUCT[5]="n7100"
LUNCHCD[5]="liquid_n7100-userdebug"

PRODUCT[6]="t0lte"
LUNCHCD[6]="liquid_t0lte-userdebug"

PRODUCT[7]="t0lteatt"
LUNCHCD[7]="liquid_t0lteatt-userdebug"

PRODUCT[8]="t0ltetmo"
LUNCHCD[8]="liquid_t0ltetmo-userdebug"

#---------------------Buildbot Code------------------------#

for VAL in "${!PRODUCT[@]}"
do
        echo "Starting build..."
        source build/envsetup.sh && lunch ${LUNCHCD[$VAL]} && time mka liquid
        cp "$SAUCE/out/target/product/${PRODUCT[$VAL]}/$VERSION-${PRODUCT[$VAL]}.zip" "$STORAGE/$VERSION-${PRODUCT[$VAL]}.zip"
        echo "Build complete!"
done

