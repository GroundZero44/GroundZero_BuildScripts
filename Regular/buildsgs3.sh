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

PRODUCT[1]="d2att"
LUNCHCD[1]="liquid_d2att-userdebug"

PRODUCT[2]="d2mtr"
LUNCHCD[2]="liquid_d2mtr-userdebug"

PRODUCT[3]="d2spr"
LUNCHCD[3]="liquid_d2spr-userdebug"

PRODUCT[4]="d2tmo"
LUNCHCD[4]="liquid_d2tmo-userdebug"

PRODUCT[5]="d2usc"
LUNCHCD[5]="liquid_d2usc-userdebug"

PRODUCT[6]="d2vzw"
LUNCHCD[6]="liquid_d2vzw-userdebug"

#---------------------Buildbot Code------------------------#

for VAL in "${!PRODUCT[@]}"
do
        echo "Starting build..."
        source build/envsetup.sh && lunch ${LUNCHCD[$VAL]} && time mka liquid
        cp "$SAUCE/out/target/product/${PRODUCT[$VAL]}/$VERSION-${PRODUCT[$VAL]}.zip" "$STORAGE/$VERSION-${PRODUCT[$VAL]}.zip"
        echo "Build complete!"
done

