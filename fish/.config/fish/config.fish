if status is-interactive
  # Commands to run in interactive sessions can go here
  set -g ignoreeof 2
  fish_vi_key_bindings
  source ~/.config/fish/aliases.fish
end


zoxide init fish | source

# uv
fish_add_path "/home/chi/.local/bin"
