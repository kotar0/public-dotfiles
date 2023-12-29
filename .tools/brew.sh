#!/bin/bash

cd $HOME

# 4. git pull origin main
# Initialize Git repository and pull configuration files
# Homebrew install
if ! command -v brew &>/dev/null; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "Homebrew already installed. Skipping."
fi

# Install Homebrew packages
brew bundle --file "$HOME/.config/brew/Brewfile"
