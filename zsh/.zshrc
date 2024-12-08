# Source path configurations
source $HOME/Development/dotfiles/zsh/path.zsh

# Source aliases
source $HOME/Development/dotfiles/zsh/aliases.zsh

# Source functions
source $HOME/Development/dotfiles/zsh/functions.zsh

# Enable tab completion
autoload -Uz compinit && compinit

# Tab completion options
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt COMPLETE_ALIASES

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY

# Starship prompt
eval "$(starship init zsh)"

# ZSH plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh