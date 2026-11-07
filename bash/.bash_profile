#
# ~/.bash_profile
#
if [[ "$TERM" == "linux" ]]; then
    setterm --blength=0
fi

export EDITOR=nvim
export VISUAL=nvim
export YAZI_ZOXIDE_OPTS="--border=sharp --preview-border=sharp"

[[ -f ~/.bashrc ]] && . ~/.bashrc
