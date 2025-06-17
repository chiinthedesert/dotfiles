alias l. 'ls -d .*'   # List only hidden files (dotfiles)
alias la 'ls -a'
alias c 'clear'


alias cp 'cp -i'                   # Confirm before overwriting a file
alias mv 'mv -i'                   # Confirm before overwriting
alias rm 'rm -i'                   # Confirm before deleting
alias .. 'cd ..'

alias tr 'trash-put'
alias trr 'trash-restore'
alias tre 'trash-empty'

# -- Status & Diffs --
alias gs 'git status -sb'       # Short, branch-aware status (highly recommended)
alias gd 'git diff'               # See unstaged changes
alias gds 'git diff --staged'     # See staged changes (what's about to be committed)
alias gdw 'git diff --word-diff'  # See changes on a word level instead of line level
# -- Staging & Committing --
alias ga 'git add'                # Standard git add
alias gaa 'git add --all'         # Stage all changes (new, modified, deleted files)
alias gap 'git add -p'            # Stage changes interactively (patch mode)
alias gc 'git commit'
alias gcm 'git commit -m'         # Commit with a message (see function tip below)
alias gca 'git commit --amend'    # Amend the previous commit with new staged changes
alias gcan 'git commit --amend --no-edit' # Amend the previous commit without changing the message
# -- Branching & Merging --
alias gb 'git branch'             # List all local branches
alias gba 'git branch -a'         # List all local and remote branches
alias gco 'git checkout'
alias gcb 'git checkout -b'       # Create a new branch and switch to it
alias gm 'git merge'
# -- History & Logs --
alias gl 'git log --oneline --graph --decorate' # A clean, one-line graph view
alias glog 'git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)"' # A very pretty and detailed log (highly recommended)
# -- Remotes --
alias gp 'git push'
alias gpf 'git push --force-with-lease' # A safer way to force push
alias gpl 'git pull'
alias gf 'git fetch'
alias grv 'git remote -v'         # List remote repositories and their URLs
# -- Stashing --
alias gst 'git stash'
alias gstl 'git stash list'
alias gstp 'git stash pop'
alias gsta 'git stash apply'
alias gstd 'git stash drop'
