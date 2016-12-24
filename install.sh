#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
mkdir -p ~/.vim/colors
ln -sfv ${BASEDIR}/vim/.vimrc ~/.vimrc
ln -sfv ${BASEDIR}/vim/colors/dracula.vim ~/.vim/colors/dracula.vim
ln -sfv ${BASEDIR}/vim/colors/molokai.vim ~/.vim/colors/molokai.vim

# tmux
ln -sfv ${BASEDIR}/tmux/.tmux.conf ~/.tmux.conf

# zsh
ln -sfv ${BASEDIR}/zsh/.zshrc ~/.zshrc
ln -sfv ${BASEDIR}/zsh/.aliases ~/.aliases
ln -sfv ${BASEDIR}/zsh/.dircolors ~/.dircolors
git clone --recursive https://github.com/mgee/slimline.git "${HOME}/.zsh/plugins/slimline"

# X11
ln -sfv ${BASEDIR}/X/.Xresources ~/.Xresources
xrdb -merge ~/.Xresources
#git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Newsbeuter
mkdir -p ~/.newsbeuter
ln -sfv ${BASEDIR}/newsbeuter/config ~/.newsbeuter/config
ln -sfv ${BASEDIR}/newsbeuter/urls ~/.newsbeuter/urls

# elinks
ln -sfv ${BASEDIR}/elinks/elinks.conf ~/.elinks/elinks.conf

# i3
mkdir -p ~/.i3
ln -sfv ${BASEDIR}/i3/config ~/.i3/config
