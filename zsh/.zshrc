# load other scripts
[ -f "${HOME}/.zshrc_local" ] && source "${HOME}/.zshrc_local"
source "${HOME}/.aliases"

# Prompt
setopt PROMPT_SUBST

function zle-line-init zle-keymap-select {
	PROMPT=""
	if [[ -n "$SSH_TTY" ]]; then
		PROMPT+="%n@%m "
	fi
	PROMPT="%F{cyan}%(5~|.../%3~|%~)%f ∙ "
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} ${vcs_info_msg_0_} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# Colors
stty erase '^?'
eval `dircolors ${HOME}/.dircolors`

# History
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zhistory
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS

# Completion
autoload -Uz compinit promptinit
compinit
promptinit

# History search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Commandline
SLIMLINE_SSH_INFO_USER_COLOR=white
SLIMLINE_SSH_INFO_HOST_COLOR=white
export SLIMLINE_GIT_REPO_INDICATOR='git'
export SLIMLINE_GIT_BRANCH='[%F{cyan}${branch}%f]'

# Different fixes for home key etc.
bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-terminal

# VIM mode
bindkey -v
export KEYTIMEOUT=1

# Load version control information
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}●%f'
zstyle ':vcs_info:*' stagedstr '%F{green}●%f'
zstyle ':vcs_info:*' formats '%u %c [%F{cyan}%b%f]'
zstyle ':vcs_info:*' actionformats '%u %c [%F{cyan}%a | %m%f]'
zstyle ':vcs_info:git:*' patch-format '%10>...>%p%<< (%n applied)'

zstyle ':vcs_info:git+post-backend:*' hooks git-remote-staged
function +vi-git-remote-staged() {
  # Show "unstaged" when changes are not staged or not committed
  # Show "staged" when last committed is not pushed
  #
  # See original VCS_INFO_get_data_git for implementation details

  # Set "unstaged" when git reports either staged or unstaged changes
  if (( gitstaged || gitunstaged )) ; then
    gitunstaged=1
  fi

  # Set "staged" when current HEAD is not present in the remote branch
  if (( querystaged )) && \
     [[ "$(${vcs_comm[cmd]} rev-parse --is-inside-work-tree 2> /dev/null)" == 'true' ]] ; then
      # Default: off - these are potentially expensive on big repositories
      if ${vcs_comm[cmd]} rev-parse --quiet --verify HEAD &> /dev/null ; then
          gitstaged=1
          if ${vcs_comm[cmd]} branch -r --contains 2> /dev/null | read REPLY ; then
            gitstaged=
          fi
      fi
  fi

  hook_com[staged]=$gitstaged
  hook_com[unstaged]=$gitunstaged
}
