#!/bin/bash

cd $HOME

# Xcode tool install
xcode-select --install

# SSH Key Generation and GitHub Setup
# Check for existing SSH key, generate if not present, and copy to clipboard.
# SSH Key Generation and GitHub Setup
ssh_key="$HOME/.ssh/id_rsa.pub"

# .sshディレクトリが存在するか確認し、存在しない場合は作成
if [ ! -d "$HOME/.ssh" ]; then
	echo "Creating .ssh directory..."
	mkdir -p "$HOME/.ssh"
	chmod 700 "$HOME/.ssh"
fi

if [ ! -f "$ssh_key" ]; then
	echo "Generating SSH keys..."
	ssh-keygen -t rsa -b 4096 -C "kotaro@temotoe.com" -f "$HOME/.ssh/id_rsa" # パスを明示的に指定
	eval "$(ssh-agent -s)"
	ssh-add "$HOME/.ssh/id_rsa"
fi

# pbcopyが使用可能かどうかを確認し、SSHキーをクリップボードにコピー
if command -v pbcopy &>/dev/null; then
	pbcopy <"$ssh_key"
	echo "SSH key copied to clipboard. Please add it to your GitHub account. Press enter to continue."
else
	echo "pbcopy is not available. Please manually copy the SSH key from $ssh_key"
fi
read -r

# Pull config files from github
# 2. git init in $HOME
# 3. git remote add origin git@github...
# 4. git pull origin main
# Initialize Git repository and pull configuration files
GIT_REPO="git@github.com:kotar0/public-dotfiles.git"
if [ ! -d "$HOME/.git" ]; then
	git init
	git remote add origin "$GIT_REPO"
	if git pull origin main; then
		echo "Successfully pulled configuration files from $GIT_REPO."
	else
		echo "Failed to pull configuration files. Check your SSH keys and repository settings."
		exit 1
	fi
else
	echo "Git already initialized. Skipping."
fi

# Homebrew install
if ! command -v brew &>/dev/null; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "Homebrew already installed. Skipping."
fi
brew bundle --file "$HOME/.config/brew/Brewfile"

# Apply OS preference
sudo sh $HOME/.config/macos/setup_new_mac.sh

echo "Hello World!(Done). Restart Mac now? (y/n)"
read -r response

# Check user's response
if [[ "$response" =~ ^([yY])$ ]]; then
	echo "Restarting now."
	sudo shutdown -r now
else
	echo "Restart aborted. Please restart manually when convenient."
fi
