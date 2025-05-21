# Set Neovim as the default editor
export EDITOR="nvim"
export VISUAL="nvim"

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=40000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt autocd extendedglob nomatch
unsetopt beep

# source aliases file
source $ZDOTDIR/aliases

# load completion system
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
#completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no

bindkey -v
bindkey '^k' history-substring-search-up
bindkey '^j' history-substring-search-down

# shell integrations
eval "$(fzf --zsh)"

# source antidote
source $ZDOTDIR/.antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load
