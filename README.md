# Complete MacOS Development Setup Guide

This guide documents the complete setup process for a new MacOS development machine.

## Initial Setup

### 1. Install Command Line Tools
```bash
xcode-select --install
```

### 2. Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 3. Install Core Tools via Homebrew

```bash
# Development tools
brew install git
brew install gh
brew install ruby
brew install starship
brew install docker-compose
brew install gitmoji

# GUI applications
brew install --cask docker
brew install --cask visual-studio-code
brew install --cask android-studio
brew install --cask iterm2
brew install --cask rectangle
brew install --cask alt-tab
brew install --cask flutter
```

### 4. Install Xcode
1. Install Xcode from Mac App Store
2. Accept license:
```bash
sudo xcodebuild -license accept
```

### 5. Set Up GitHub SSH
```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Start SSH agent
eval "$(ssh-agent -s)"

# Add SSH key to agent
ssh-add ~/.ssh/id_ed25519

# Copy public key
pbcopy < ~/.ssh/id_ed25519.pub
```
Then add to GitHub.com → Settings → SSH Keys

Test connection:
```bash
ssh -T git@github.com
```

### 6. Configure Git
```bash
# Initial git config
git config --global credential.helper osxkeychain
git config --global user.name "Sean Klein"
git config --global user.email "klein2ms@gmail.com"

# After dotfiles repo is created, set up symlink:
mv ~/.gitconfig ~/.gitconfig.backup
ln -s ~/Development/dotfiles/git/.gitconfig ~/.gitconfig

# Verify configuration
git config --list


### 7. Set Up Directory Structure
```bash
mkdir ~/Development
```

### 8. Terminal Setup

#### Install Font
```bash
brew install --cask font-fira-code-nerd-font
```

#### Install ZSH Plugins
```bash
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
```

#### Configure ZSH
Create/edit ~/.zshrc:
```bash
# Ruby configuration
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH"

# Starship prompt
eval "$(starship init zsh)"

# Enable better tab completion
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

# General aliases
alias ls='ls -G'
alias ll='ls -lah'
alias zshconfig="code ~/.zshrc"
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

# ZSH plugins (keep these at the end)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

#### Link ZSH Configuration
```bash
# Backup existing zsh config
mv ~/.zshrc ~/.zshrc.backup

# Create symlink to dotfiles zsh config
ln -s ~/Development/dotfiles/zsh/.zshrc ~/.zshrc

# Reload configuration
source ~/.zshrc

### 9. VS Code Setup

#### Install Extensions
```bash
code --install-extension Dart-Code.dart-code
code --install-extension Dart-Code.flutter
code --install-extension usernamehw.errorlens
code --install-extension oderwat.indent-rainbow
code --install-extension PKief.material-icon-theme
code --install-extension wayou.vscode-todo-highlight
code --install-extension aaron-bond.better-comments
```

### 10. Flutter Setup
```bash
# Accept Android licenses
flutter doctor --android-licenses

# Install CocoaPods for iOS development
gem install cocoapods
```

### 11. Android Studio Setup
1. Open Android Studio
2. Complete initial setup wizard
3. Install Android SDK Command-line Tools:
   - Open SDK Manager (Tools > SDK Manager)
   - Select "SDK Tools" tab
   - Check "Android SDK Command-line Tools"
   - Click Apply

### 12. iTerm2 Setup
1. Open iTerm2 Preferences
2. Go to Profiles → Text
3. Select "FiraCode Nerd Font" as font

## Verification Steps

Run these commands to verify installation:
```bash
# Check core tools
flutter doctor -v
git --version
ruby --version
pod --version
docker --version
gh --version

# Verify ZSH plugins by:
# 1. Type an invalid command - should show in red
# 2. Type a previous command - should show autosuggestions
# 3. Try tab completion
```