#!/bin/sh
xset -b # disable bell
xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap

exec i3
