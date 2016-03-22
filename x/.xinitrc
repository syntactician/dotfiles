#!/bin/sh
setxkbmap dvorak
xrdb ~/.Xresources

hsetroot -solid "#2b303b"
unclutter --timeout 2 &

mkdir /tmp /tmp/nowm

dunst &
~/.wm/bar.sh | lemonbar -pd -f 'Liberation Mono' &
wew | ~/.wm/watch.sh &
exec sxhkd
