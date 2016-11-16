#!/usr/bin/env zsh

if [ -f $HOME/.Xresources ]; then
    xrdb -merge $HOME/.Xresources
fi
