#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sfv ${BASEDIR}/bash/.bash_profile ~/.bash_profile
ln -sfv ${BASEDIR}/bash/.bash_prompt ~/.bash_prompt
ln -sfv ${BASEDIR}/bash/.bashrc ~/.bashrc
ln -sfv ${BASEDIR}/bash/.inputrc ~/.inputrc
ln -sfv ${BASEDIR}/bash/.bash_aliases ~/.bash_aliases
