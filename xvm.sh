#!/bin/sh

# WoT installation directory defintion
WOT_ROOT=$HOME/Documents/World_of_Tanks

# Check WoT installation directory
if [ ! -d $WOT_ROOT ]; then
    # Cannot detect Wot installation directory
    echo "Oops!"
    echo "No WoT installation directory detected."
    echo "This script assumes Codeweavers World of tanks wrapper now."
    exit 1
fi

echo "Downloading XVM..."
curl http://dl1.modxvm.com/get/bin/xvm-6.2.0.1.zip -e http://dl1.modxvm.com/bin/xvm-6.2.0.1.zip -o xvm.zip || ( echo "Download error. Exiting." ; exit 1 )

echo "Extracting compresed file..."
unzip xvm.zip -d xvm || ( echo "Unzip error. Exiting." ; rm xvm.zip ; exit 1 )
echo "Merging MOD..."
rsync -abvuP ./xvm/res_mods/ $WOT_ROOT/res_mods/ || ( echo "Rsync error. Exiting." ; exit 1 )
echo "Renaming: $WOT_ROOT/res_mods/configs/xvm/xvm.xc.sample"
echo "to -> $WOT_ROOT/res_mods/configs/xvm/xvm.xc ..."
mv $WOT_ROOT/res_mods/configs/xvm/xvm.xc.sample $WOT_ROOT/res_mods/configs/xvm/xvm.xc || ( echo "Renaming error. Exiting." ; exit 1 )
rm -rf xvm.zip xvm
echo "Done! Panzer Vor!"
