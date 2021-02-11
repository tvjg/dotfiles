#!/bin/sh
xset -b # disable bell
xrdb -merge -I$HOME ~/.Xresources
xmodmap ~/.Xmodmap

exec i3
