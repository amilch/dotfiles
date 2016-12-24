#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script

setxkbmap us -variant altgr-intl -option 'caps:swapescape'

xrdb -merge ~/.Xresources

exec i3
