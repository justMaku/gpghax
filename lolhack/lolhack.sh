#link the usb drive dirs into the /gaadata
cd /media/games
for D in *; do
    if [ -d "${D}" ]; then
        ln -s /media/games/${D} /gaadata/${D}
    fi
done

#backup the original db (will not overwrite the file after the first backup)
cp -n /gaadata/databases/regional.db /media/games/backup.db

#install our custom db
cp /media/games/custom.db /gaadata/databases/regional.db

#sync usb drive
sync

# kill the ui process
killall ui_menu

# restart ui
/usr/sony/bin/ui_menu

# sleep forever so the usb is never unmounted
while :; do sleep 10; done
