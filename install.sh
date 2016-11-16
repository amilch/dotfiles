#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sfv ${BASEDIR}/vim/.vimrc ~/.vimrc
ln -sfv ${BASEDIR}/tmux/.tmux.conf ~/.tmux.conf
ln -sfv ${BASEDIR}/fish/config.fish ~/.config/fish/config.fish
ln -sfv ${BASEDIR}/zsh/.zshrc ~/.zshrc
ln -sfv ${BASEDIR}/zsh/.aliases ~/.aliases
ln -sfv ${BASEDIR}/zsh/.dircolors ~/.dircolors
ln -sfv ${BASEDIR}/X/.Xresources ~/.Xresources
ln -sfv ${BASEDIR}/X/.xsession ~/.xsession

xrdb -merge ~/.Xresources
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
