#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -sfv ${BASEDIR}/vim/.vimrc ~/.vimrc

# tmux
ln -sfv ${BASEDIR}/tmux/.tmux.conf ~/.tmux.conf

# zsh
ln -sfv ${BASEDIR}/zsh/.zshrc ~/.zshrc
ln -sfv ${BASEDIR}/zsh/.aliases ~/.aliases
ln -sfv ${BASEDIR}/zsh/.dircolors ~/.dircolors
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# X11
ln -sfv ${BASEDIR}/X/.Xresources ~/.Xresources
xrdb -merge ~/.Xresources
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Newsbeuter
ln -sfv ${BASEDIR}/newsbeuter/config ~/.newsbeuter/config
ln -sfv ${BASEDIR}/newsbeuter/urls ~/.newsbeuter/urls

# elinks
ln -sfv ${BASEDIR}/elinks/elinks.conf ~/.elinks/elinks.conf
