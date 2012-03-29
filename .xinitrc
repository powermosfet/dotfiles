#!/bin/bash

setxkbmap -layout no
xmodmap ~/.Xmodmap
xinput --set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Tap Action" 2,3,0,0,0,0,0 &
xrandr --newmode "1280x1024"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync
xrandr --addmode VGA1 1280x1024
# xrandr --output LVDS1 --mode 1280x800
# xrandr --output VGA1 --right-of LVDS1 --mode 1280x1024 &
trayer --align right --widthtype request &

exec ck-launch-session dbus-launch xmonad
# exec xmonad
