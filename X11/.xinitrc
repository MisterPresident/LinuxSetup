perl /home/raabls/xSwipe/xSwipe.pl -n &
xset dpms 300&
compton &
#fusuma &
#syndaemon -K -i 0.5 -R -d &
xautolock -time 6 -locker 'i3lock -c 000000' &
exec i3 
