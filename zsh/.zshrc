#load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
  #zgen load subnixr/minimal
  zgen load mgee/slimline
  zgen save
fi
