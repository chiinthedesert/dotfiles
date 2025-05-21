# Set Neovim as the default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=40000
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# custom the prompt
# Enable prompt substitution
setopt prompt_subst

# Load git branch info
autoload -Uz vcs_info
precmd() { vcs_info }

# Git branch display format
zstyle ':vcs_info:git:*' formats ' %b'

# Left prompt: just the current directory
PROMPT=' %~ %# '

# Right prompt: Git branch info (right-aligned)
RPROMPT='${vcs_info_msg_0_}'

# source aliases file
source $ZDOTDIR/aliases

# load completion system
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

# source antidote
source $ZDOTDIR/.antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

