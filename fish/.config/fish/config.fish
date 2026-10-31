if status is-interactive
  set -g fish_greeting "remember you one day will die, how do you live ?" (set_color --bold blue) "RIGHT HERE, RIGHT NOW"

  # Commands to run in interactive sessions can go here
  set -g ignoreeof 2
  fish_vi_key_bindings
  source ~/.config/fish/aliases.fish
end


zoxide init fish | source

# uv
fish_add_path "/home/chi/.local/bin"

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx YAZI_ZOXIDE_OPTS '--border=sharp --preview-border=sharp'
