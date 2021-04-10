#!/usr/bin/env bork

# # # # #
# Init  #
# # # # #

#
# Chicken Egg Stuff
#

ok brew
ok brew bork


#
# File Vault
#

ok check "fdesetup status | grep 'On'"
if check_failed; then
        echo "FileVault is not set up. Please enable FileVault before continuing."
        open "/System/Library/PreferencePanels/Security.prefpane"
        exit 1
fi


#
# Computer Name
#

if [ -n "$COMPUTER_NAME" ]; then
        echo "Setting computer's name to $COMPUTER_NAME"
        ok scutil ComputerName $COMPUTER_NAME
        ok scutil HostName $COMPUTER_NAME
        ok scutil LocalHostName $COMPUTER_NAME
fi


#
# SSH Key
#

ok directory "$HOME/.ssh"
ok check "[ -e $HOME/.ssh/id_ed25519 ]"
if check_failed && satisfying; then
	echo "Generating SSH Key"
	ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "lucy@lucymhdavies.com"
	echo "Please upload your new SSH key to GitHub before continuing"
	cat ~/.ssh/id_ed25519.pub | pbcopy
	read -p "Press Return to continue" etc
fi
ok brew gnupg
ok brew pinentry-mac





#
# Dev Utils
#

ok directory "$HOME/git_src"
ok github $HOME/git_src/dev_utils lucymhdavies/dev_utils --branch=master --ssh







# # # # # # # # # #
# Everything Else #
# # # # # # # # # #




#
# Rosetta
#

if [[ $(uname -p) == 'arm' ]] && [[ $(uname -s) == 'Darwin' ]]; then
	ok check "/usr/sbin/softwareupdate --install-rosetta --agree-to-license"
fi






#
# Unsorted Other Things
#




# Important Brew Stuff
ok brew git
ok brew go
ok brew mas
ok brew htop

# Bash requires some additional setup
ok brew bash
ok shells /opt/homebrew/bin/bash
did_install && chsh -s /opt/homebrew/bin/bash

# Important Cask Stuff
ok cask iterm2
# TODO: iTerm Config
ok cask google-chrome
ok cask chrome-remote-desktop-host
ok cask maccy
# TODO: Maccy Config
ok cask discord
ok cask zoom
ok cask lastpass
# TODO: lastpass keyboard shortcuts
ok cask bartender
# TODO: Bartender config?
ok cask istat-menus
# TODO: istatmenu license
# TODO: istatmenu config
ok cask keybase
# TODO: Setup / folders / etc
# sudo kmutil load -p /Library/Filesystems/kbfuse.fs/Contents/Extensions/11/kbfuse.kext
ok cask slack
ok cask visual-studio-code
# TODO: All the config and stuff!


ok cask backblaze
# TODO: Launch /opt/homebrew/Caskroom/backblaze/7.0.2.490/bzd
# TODO: Set up license and config manually

# Important MAS Stuff
ok mas 441258766 Magnet
# TODO: System Preferences > Accessibility > Magnet.app
# TODO: Config: ~/Library/Preferences/com.crowdcafe.windowmagnet.plist
ok mas 497799835 Xcode
did_install && xcode-select --install

ok mas 1482454543 Twitter
ok mas 682658836 GarageBand
ok mas 1278508951 Trello
ok mas 411643860 DaisyDisk
ok mas 1480068668 Messenger


# Can't Do Yet
# https://github.com/hashicorp/vault/issues/10645
# ok brew vault
# https://docs.docker.com/docker-for-mac/apple-m1/
# ok cask docker



#
# Bash Stuff
#




#
# Games
#

ok cask minecraft
ok cask steam
ok mas 1246969117 Steam Link
ok cask openra



#
# Other Config
#
# TODO: Enable Home Sharing
# TODO: Time Machine?
# TODO: User Avatar
