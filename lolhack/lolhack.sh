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

# Remove fucked up symlinks.
rm /gaadata/1/1
rm /gaadata/2/2
rm /gaadata/3/3
rm /gaadata/4/4
rm /gaadata/5/5
rm /gaadata/6/6
rm /gaadata/7/7
rm /gaadata/8/8
rm /gaadata/9/9
rm /gaadata/10/10
rm /gaadata/11/11
rm /gaadata/12/12
rm /gaadata/13/13
rm /gaadata/14/14
rm /gaadata/15/15
rm /gaadata/16/16
rm /gaadata/17/17
rm /gaadata/18/18
rm /gaadata/19/19
rm /gaadata/20/20

shutdown -h now
