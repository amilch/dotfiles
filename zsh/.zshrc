#load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
  #zgen load subnixr/minimal
  zgen load mgee/slimline
  zgen save
fi

source "${HOME}/.zshrc_local"

SLIMLINE_SSH_INFO_USER_COLOR=white
SLIMLINE_SSH_INFO_HOST_COLOR=white

TERM=xterm-256color
