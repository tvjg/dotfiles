#!/bin/sh
xset -b # disable bell
xrdb -merge ~/.Xresources
xrandr --dpi 192x192

sh .wallpaper/rotate.sh &
urxvtd -q -f -o
compton -f -D 2 -I .01 -O .01 -r0 -b

exec dbus-launch --exit-with-session bash -c "i3"
