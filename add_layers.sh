#!/bin/bash
#
# $1 should be repo base directory
#

layers=$(find $1/meta* -name layer.conf | xargs -i realpath {}  | grep -v scripts | grep -v meta-tlk | grep -v 'meta-eca' | grep -v obsolete | sed -e 's:/conf/layer.conf: \\:g')
bblayers=$(find $1 -name bblayers.conf)
if [ -z $bblayers ]; then
    echo "Error: Please source the OE environment first"
fi

echo "" >> $bblayers
echo "BBLAYERS += \"$layers " >> $bblayers
echo "\"" >> $bblayers