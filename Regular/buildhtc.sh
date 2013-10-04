#!/bin/bash
#
# LiquidSmooth Build Bot v1.1
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
STORAGE="/home/www/devs/teamliquid/official"

#--------------------Default Settings----------------------#

# your package name and version number
VERSION="Liquid-JB-v2.10-OFFICIAL"

#--------------------Default Products----------------------#

PRODUCT[1]="vigor"
LUNCHCD[1]="liquid_vigor-userdebug"

PRODUCT[2]="m7tmo"
LUNCHCD[2]="liquid_m7tmo-userdebug"

PRODUCT[3]="m7spr"
LUNCHCD[3]="liquid_m7spr-userdebug"

PRODUCT[4]="m7att"
LUNCHCD[4]="liquid_m7att-userdebug"

PRODUCT[5]="m7ul"
LUNCHCD[5]="liquid_m7ul-userdebug"

#---------------------Buildbot Code------------------------#

for VAL in "${!PRODUCT[@]}"
do
        echo "Starting build..."
        source build/envsetup.sh && lunch ${LUNCHCD[$VAL]} && time mka liquid
        cp "$SAUCE/out/target/product/${PRODUCT[$VAL]}/$VERSION-${PRODUCT[$VAL]}.zip" "$STORAGE/$VERSION-${PRODUCT[$VAL]}.zip"
        echo "Build complete!"
done

