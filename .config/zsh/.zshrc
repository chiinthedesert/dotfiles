# ──[ ENVIRONMENT VARIABLES ]─────────────────────────────────────────────
export EDITOR="nvim"
export VISUAL="nvim"


# ──[ SOURCE ANTIDOTE PLUGIN MANAGER ]────────────────────────────────────
source $ZDOTDIR/.antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# ──[ SHELL OPTIONS ]─────────────────────────────────────────────────────
HISTFILE=$ZDOTDIR/.histfile
HISTSIZE=10000
SAVEHIST=40000
HISTDUP=erase
setopt appendhistory sharehistory
setopt hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_find_no_dups
setopt autocd extendedglob nomatch
unsetopt beep

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.


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

# ──[ PROMPT ]────────────────────────────────────────────────────────────
autoload -Uz promptinit; promptinit
prompt pure

# shell integrations
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# ──[ KEYBINDINGS ]───────────────────────────────────────────────────────
bindkey -v
export KEYTIMEOUT=1
bindkey -M vicmd 'K' history-substring-search-up
bindkey -M vicmd 'J' history-substring-search-down
bindkey -M viins 'K' history-substring-search-up
bindkey -M viins 'J' history-substring-search-down
bindkey -M viins -r '^R'
bindkey -M vicmd -r '^R'
bindkey -M vicmd '^R' fzf-history-widget
bindkey -M viins '^R' fzf-history-widget


# ──[ ALIASES ]───────────────────────────────────────────────────────────
source $ZDOTDIR/aliases

export FUNCNEST=10000
