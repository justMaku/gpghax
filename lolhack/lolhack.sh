#!/bin/sh
LOG=/media/uninstall.log

# Remount with write access
mount -o rw,remount /gaadata

# Clear log
echo "" > $LOG

find /gaadata > /media/filelist.log

# Remove user settings file, system will recreate it on the next boot.
rm /data/AppData/sony/ui/user.pre

# Restore default DB
if [ -e /media/databases/default.db  ]; then
    cp /media/databases/default.db /gaadata/databases/regional.db
    
    echo "Restored default DB" >> $LOG
else
    echo "Missing default database file." > $LOG
fi

COUNT=1
COUNT_MAX=25
# Remove broken symlinks
while [ $COUNT -le $COUNT_MAX ]
do
    echo "Checking wrong symlinks for game $COUNT" >> $LOG
    if [ -e /gaadata/$COUNT/$COUNT ]; then
        echo "Wrong symlink detected for game $COUNT, removing" >> $LOG
        rm -rf /gaadata/$COUNT/$COUNT
    else
        echo "Nothing wrong with game $COUNT, continuing" >> $LOG
    fi
    COUNT=`expr $COUNT + 1`
done

shutdown -h now