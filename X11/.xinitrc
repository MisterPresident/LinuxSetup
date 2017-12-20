#!/bin/bash
if [ -n "$DISPLAY" ]; then
    export BROWSER=google-chrome-stable
else
    export BROWSER=links
fi

xrdb ~/.Xdefaults
/home/raabls/.screenlayout/screenlayout.sh
/home/raabls/Software/fusuma/exe/fusuma -c /home/raabls/.config/fusuma/fusuma.yml &
xautolock -time 6 -locker 'i3lock.sh' &
/home/raabls/Software/lightsOn/lightsOn.sh &
compton -cCG -b --vsync opengl
xflux -l 48.5724264 -g 13.989240900000027 &
exec i3
