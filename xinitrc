#!/bin/sh
setxkbmap dvorak
xrdb ~/.Xresources

hsetroot -solid "#2b303b"
unclutter --timeout 2 &

dunst &
~/.wm/bar.sh | lemonbar -pd -f 'Liberation Mono' &
wew | ~/.wm/watch.sh &
exec sxhkd -c ~/.sxhkdrc

# sxhkd -c ~/.sxhkdrc &
# exec bspwm
