#!/bin/sh

REGION=$(cat /gaadata/geninfo/REGION|head -1|head -c 8)
COUNT=1
COUNT_MAX=30

cp /usr/sony/share/data/databases/regional_${REGION}.db /gaadata/databases/
echo "Restored DB from: /usr/sony/share/data/databases/regional_${REGION}.db" > /media/uninstall.log

while [ $COUNT -le $COUNT_MAX ]
do
if [ -e /gaadata/$COUNT/$COUNT ]; then
    echo "Wrong symlink detected for game $COUNT, removing" > /media/uninstall.log
    rm /gaadata/$COUNT/$COUNT
    COUNT=`expr $COUNT + 1`
    continue
fi
COUNT=`expr $COUNT + 1`
done

sync