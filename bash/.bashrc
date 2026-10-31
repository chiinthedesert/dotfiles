#
# ~/.bashrc
#

# interactive shells only
[[ $- != *i* ]] && return

export PATH="$PATH:/home/chi/.cargo/bin"

# alias
# ls
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -A --color=auto'
alias l='ls -lah --color=auto'

# vi mode
set -o vi

# history
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend

# bash completion
if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  source /usr/share/bash-completion/bash_completion
fi

# shell integrations
eval "$(fzf --bash)"
eval "$(zoxide init bash)"
eval "$(starship init bash)"

# function
# yazi
function y() {
  local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
  command rm -f -- "$tmp"
}
