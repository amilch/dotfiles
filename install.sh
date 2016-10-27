#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sfv ${BASEDIR}/vim/.vimrc ~/.vimrc
ln -sfv ${BASEDIR}/tmux/.tmux.conf ~/.tmux.conf
ln -sfv ${BASEDIR}/fish/config.fish ~/.config/fish/config.fish
