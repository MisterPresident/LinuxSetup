#!/bin/zsh
#scrot /tmp/screenshot.png
#i3lock
#convert /tmp/screenshot.png -blur 0x5 /tmp/screenshot.png
#convert /tmp/screenshot.png -scale 10% -scale 1000% /tmp/screenshot.png
#pkill i3lock && i3lock -i /tmp/screenshot.png

#IMG=/tmp/screenshot.png

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#16db0088'  # default
T='#ffffffee'  # text
W='#db0700bb'  # wrong
V='#16db00bb'  # verifying

i3lock              \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--textcolor=$T        \
--keyhlcolor=$W       \
--bshlcolor=$W        \
\
--screen 0            \
--clock               \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %Y" \
--blur 5              \

