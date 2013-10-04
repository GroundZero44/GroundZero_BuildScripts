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

PRODUCT[1]="jflteatt"
LUNCHCD[1]="liquid_jflteatt-userdebug"

PRODUCT[2]="jfltecan"
LUNCHCD[2]="liquid_jfltecan-userdebug"

PRODUCT[3]="jfltespr"
LUNCHCD[3]="liquid_jfltespr-userdebug"

PRODUCT[4]="jfltetmo"
LUNCHCD[4]="liquid_jfltetmo-userdebug"

PRODUCT[5]="jflteusc"
LUNCHCD[5]="liquid_jflteusc-userdebug"

PRODUCT[6]="jfltevzw"
LUNCHCD[6]="liquid_jfltevzw-userdebug"

PRODUCT[7]="jfltexx"
LUNCHCD[7]="liquid_jfltexx-userdebug"

#---------------------Buildbot Code------------------------#

for VAL in "${!PRODUCT[@]}"
do
        echo "Starting build..."
        source build/envsetup.sh && lunch ${LUNCHCD[$VAL]} && time mka liquid
        cp "$SAUCE/out/target/product/${PRODUCT[$VAL]}/$VERSION-${PRODUCT[$VAL]}.zip" "$STORAGE/$VERSION-${PRODUCT[$VAL]}.zip"
        echo "Build complete!"
done

