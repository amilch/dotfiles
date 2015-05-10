#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sfv ${BASEDIR}/bash/.bash_prompt ~/.bash_prompt
ln -sfv ${BASEDIR}/bash/.bashrc ~/.bashrc
