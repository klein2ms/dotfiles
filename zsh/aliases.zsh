# General aliases
alias ls='ls -G'
alias ll='ls -lah'
alias zshconfig="code ~/Development/dotfiles/zsh/.zshrc"
alias reload="source ~/.zshrc"
alias dev="cd ~/Development"

# Git aliases
alias gs="git status"
alias gp="git pull"
alias gpm="git pull origin main"
alias gc="git commit -m"
alias gac="git add . && git commit -m"

# Flutter aliases
alias fd="flutter doctor"
alias fpg="flutter pub get"
alias fr="flutter run"

# Docker aliases
alias d="docker"
alias dc="docker compose"
alias dps="docker ps"
alias dex="docker exec -it"