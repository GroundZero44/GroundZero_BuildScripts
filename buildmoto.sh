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

PRODUCT[1]="maserati"
LUNCHCD[1]="liquid_maserati-userdebug"

PRODUCT[2]="solana"
LUNCHCD[2]="liquid_solana-userdebug"

PRODUCT[3]="spyder"
LUNCHCD[3]="liquid_spyder-userdebug"

PRODUCT[4]="targa"
LUNCHCD[4]="liquid_targa-userdebug"

PRODUCT[5]="umts_spyder"
LUNCHCD[5]="liquid_umts_spyder-userdebug"

#---------------------Buildbot Code------------------------#

for VAL in "${!PRODUCT[@]}"
do
        echo "Starting build..."
        source build/envsetup.sh && lunch ${LUNCHCD[$VAL]} && time mka liquid
        if [ $PRODUCT = "umts_spyder" ]; then
            cp "$SAUCE/out/target/product/${PRODUCT[$VAL]}/$VERSION-umts.zip" "$STORAGE/$VERSION-${PRODUCT[$VAL]}.zip"
        else
            cp "$SAUCE/out/target/product/${PRODUCT[$VAL]}/$VERSION-${PRODUCT[$VAL]}.zip" "$STORAGE/$VERSION-${PRODUCT[$VAL]}.zip"
        fi
        echo "Build complete!"
done

