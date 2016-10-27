#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sfv ${BASEDIR}/vim/.vimrc ~/.vimrc
