cd $HOME

# Xcode tool install
xcode-select --install

# SSH Key Generation and GitHub Setup
# Check for existing SSH key, generate if not present, and copy to clipboard.
if [ ! -f ~/.ssh/id_rsa.pub ]; then
	ssh-keygen -t rsa -b 4096 -C "kotaro@temotoe.com" # Replace with your email
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
fi
pbcopy <~/.ssh/id_rsa.pub
echo "SSH key copied to clipboard. Please add it to your GitHub account. Press enter to continue."
read -r

# Pull config files from github
# 2. git init in $HOME
# 3. git remote add origin git@github...
# 4. git pull origin main
# Initialize Git repository and pull configuration files
GIT_REPO="git@github.com:kotar0/public-dotfiles.git"
git init
git remote add origin $GIT_REPO
if git pull origin main; then
	echo "Successfully pulled configuration files from $GIT_REPO."
else
	echo "Failed to pull configuration files. Check your SSH keys and repository settings."
	exit 1
fi

# brew install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file $HOME/.config/brew/Brewfile

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
