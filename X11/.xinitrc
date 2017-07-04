#!/bin/bash
/home/raabls/.screenlayout/screenlayout.sh
/home/raabls/fusuma/exe/fusuma -c /home/raabls/.config/fusuma/fusuma.yml &
xautolock -time 6 -locker 'i3lock.sh' &
# /home/raabls/Software/lightsOn/lightsOn.sh &
compton &
exec i3 
