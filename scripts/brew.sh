#!/bin/bash

# Install Homebrew if not installed
if test ! $(which brew); then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
brew update

# Install command line tools
brew install git
brew install gh
brew install ruby
brew install starship
brew install docker-compose
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions

# Install applications
brew install --cask docker
brew install --cask visual-studio-code
brew install --cask android-studio
brew install --cask iterm2
brew install --cask alfred
brew install --cask rectangle
brew install --cask alt-tab
brew install --cask flutter
brew install --cask font-fira-code-nerd-font
brew install --cask notion
brew install --cask bruno

# Cleanup
brew cleanup