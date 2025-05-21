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
fpath=($ZDOTDIR/prompt $fpath)
autoload -Uz prompt_purification_setup; prompt_purification_setup
  
# source aliases file
source $ZDOTDIR/aliases

# load completion system
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

# source antidote
source $ZDOTDIR/.antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

