#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

safe_link () {
    # Makes a backup of the destination file, if it was no link
    if [[ -L $2 ]]; then
        ln -sfv $1 $2
    else
        ln -sfvb $1 $2
    fi
}

# vim
mkdir -p ~/.vim/colors
safe_link ${BASEDIR}/vim/.vimrc ~/.vimrc
safe_link ${BASEDIR}/vim/colors/dracula.vim ~/.vim/colors/dracula.vim
safe_link ${BASEDIR}/vim/colors/molokai.vim ~/.vim/colors/molokai.vim

# vim plugins
mkdir -p ~/.vim/bundle
safe_link ${BASEDIR}/vim/bundle/vim-pathogen ~/.vim/bundle/vim-pathogen
safe_link ${BASEDIR}/vim/bundle/vim-surround ~/.vim/bundle/vim-surround
safe_link ${BASEDIR}/vim/bundle/nerdcommenter ~/.vim/bundle/nerdcommenter
safe_link ${BASEDIR}/vim/bundle/nerdtree ~/.vim/bundle/nerdtree
safe_link ${BASEDIR}/vim/bundle/jedi-vim ~/.vim/bundle/jedi-vim

# tmux
safe_link ${BASEDIR}/tmux/.tmux.conf ~/.tmux.conf

# zsh
safe_link ${BASEDIR}/zsh/.zshrc ~/.zshrc
safe_link ${BASEDIR}/zsh/.aliases ~/.aliases
safe_link ${BASEDIR}/zsh/.dircolors ~/.dircolors

# X11
safe_link ${BASEDIR}/X/.Xresources ~/.Xresources
safe_link ${BASEDIR}/X/.xinitrc ~/.xinitrc

xrdb -merge ~/.Xresources

# Newsbeuter
mkdir -p ~/.newsbeuter
safe_link ${BASEDIR}/newsbeuter/config ~/.newsbeuter/config
safe_link ${BASEDIR}/newsbeuter/urls ~/.newsbeuter/urls

# elinks
safe_link ${BASEDIR}/elinks/elinks.conf ~/.elinks/elinks.conf

# i3
mkdir -p ~/.i3
safe_link ${BASEDIR}/i3/config ~/.i3/config
safe_link ${BASEDIR}/i3/i3shell ~/.i3/i3shell
safe_link ${BASEDIR}/i3/i3status ~/.i3/i3status

# compton
safe_link ${BASEDIR}/compton/compton.config ~/.config/compton.config

# gdb
safe_link ${BASEDIR}/gdb/.gdbinit ~/.gdbinit
