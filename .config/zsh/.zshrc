# ──[ ENVIRONMENT VARIABLES ]─────────────────────────────────────────────
export EDITOR="nvim"
export VISUAL="nvim"


# ──[ SOURCE ANTIDOTE PLUGIN MANAGER ]────────────────────────────────────
source $ZDOTDIR/.antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# ──[ SHELL OPTIONS ]─────────────────────────────────────────────────────
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=40000
HISTDUP=erase
setopt appendhistory sharehistory
setopt hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups
setopt autocd extendedglob nomatch
unsetopt beep


# ──[ COMPLETION SYSTEM ]─────────────────────────────────────────────────
autoload -U compinit; compinit
 # show hidden files
_comp_options+=(globdots)
 # completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
 # allow caching for faster completions (use with `zsh-users/zsh-completions`)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh/completions

# ──[ KEYBINDINGS ]───────────────────────────────────────────────────────
bindkey -v
bindkey '^k' history-substring-search-up
bindkey '^j' history-substring-search-down

# ──[ PROMPT ]────────────────────────────────────────────────────────────
autoload -Uz promptinit; promptinit
prompt pure

# shell integrations
eval "$(fzf --zsh)"


# ──[ ALIASES ]───────────────────────────────────────────────────────────
source $ZDOTDIR/aliases

export FUNCNEST=10000
