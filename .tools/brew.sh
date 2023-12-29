#!/bin/bash



cd $HOME

# Install Rossetta 2
sudo softwareupdate --install-rosetta

# Homebrew install
if ! command -v brew &>/dev/null; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "Homebrew already installed. Skipping."
fi

# Install Homebrew packages
brew bundle --file "$HOME/.config/brew/Brewfile"
