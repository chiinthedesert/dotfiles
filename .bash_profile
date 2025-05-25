#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Change the zsh config path
export ZDOTDIR=$HOME/.config/zsh

# Launch Hyprland
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec Hyprland
fi

