#!/bin/bash

cd $HOME

# SSH Key Generation and GitHub Setup
# Check for existing SSH key, generate if not present, and copy to clipboard.
ssh_key="$HOME/.ssh/id_rsa.pub"
email="kotaro@temotoe.com"

# .sshディレクトリが存在するか確認し、存在しない場合は作成
if [ ! -d "$HOME/.ssh" ]; then
	echo "Creating .ssh directory..."
	mkdir -p "$HOME/.ssh"
	chmod 700 "$HOME/.ssh"
fi

if [ ! -f "$ssh_key" ]; then
	echo "Generating SSH keys..."
	ssh-keygen -t rsa -b 4096 -C "$email" -f "$HOME/.ssh/id_rsa" # パスを明示的に指定
	ssh-agent -s

	if [ ! -f "$HOME/.ssh/config" ]; then
		touch $HOME/.ssh/config
	fi

	# Open your ~/.ssh/config file and add the following lines.
	echo "Adding configuration to ~/.ssh/config"
	{
		echo "Host github.com"
		echo "  AddKeysToAgent yes"
		echo "  UseKeychain yes"
		echo "  IdentityFile ~/.ssh/id_rsa" # If your SSH key file has a different name or path, modify accordingly.
	} >>$HOME/.ssh/config

	ssh-add "$HOME/.ssh/id_rsa"
fi

# pbcopyが使用可能かどうかを確認し、SSHキーをクリップボードにコピー
if command -v pbcopy &>/dev/null; then
	pbcopy <"$ssh_key"
	echo "SSH key copied to clipboard. Please add it to your GitHub account. Press enter to continue."
else
	echo "pbcopy is not available. Please manually copy the SSH key from $ssh_key"
fi
