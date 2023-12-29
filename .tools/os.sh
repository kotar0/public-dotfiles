#!/bin/bash

# Apply OS preference
sudo sh $HOME/.config/macos/setup_new_mac.sh

echo "Restart Mac now? (y/n)"
read -r response

# Check user's response
if [[ "$response" =~ ^([yY])$ ]]; then
	echo "Restarting now."
	sudo shutdown -r now
else
	echo "Restart aborted. Please restart manually when convenient."
fi
