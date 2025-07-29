#!/bin/bash

DOTFILES="$HOME/Development/dotfiles"

echo "Setting up your Mac..."

# Run Homebrew installations
echo "Installing applications via Homebrew..."
source "$DOTFILES/scripts/brew.sh"

# Create necessary directories
echo "Creating directories..."
mkdir -p ~/.config

# Set up symlinks
echo "Creating symlinks..."
ln -sf "$DOTFILES/zsh/.zshrc" ~/.zshrc
ln -sf "$DOTFILES/git/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES/starship/starship.toml" ~/.config/starship.toml

# Source zsh configuration
echo "Sourcing zsh configuration..."
source ~/.zshrc

echo "Setup complete! 🎉"
