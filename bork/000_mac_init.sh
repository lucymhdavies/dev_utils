#!/usr/bin/env bork satisfy
# BORK_CONTEXT: EVERYWHERE

#
# Chicken Egg Stuff
#
ok brew
ok brew bork --HEAD
if did_upgrade; then
	echo "========================================"
	echo "Bork Upgraded! Run Bork Again"
	echo "========================================"
	exit 1
fi


#
# Homebrew
#

# Make sure we've not got a custom branch of Brew formula checked out
# on latest macOS this is $(brew --prefix)/Library/Taps/homebrew/homebrew-core
# on earlier macOS this is $(brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core
[ -d $(brew --prefix)/Library/Taps/homebrew/homebrew-core ] && \
	ok github $(brew --prefix)/Library/Taps/homebrew/homebrew-core Homebrew/homebrew-core --branch=master --untracked-files=normal
[ -d $(brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core ] && \
	ok github $(brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core Homebrew/homebrew-core --branch=master --untracked-files=normal



#
# File Vault
#

ok check "fdesetup status | grep 'On'"
if check_failed; then
	echo "========================================"
	echo "ERROR"
	echo "========================================"
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
	echo
	echo "========================================"
	echo "Generating SSH Key"
	echo "========================================"
	ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "lucy@lucymhdavies.com"
	echo "Please upload your new SSH key to GitHub and BitBucket before continuing"
	echo "    https://github.com/settings/keys"
	echo "    https://bitbucket.org/account/settings/ssh-keys/"
	cat ~/.ssh/id_ed25519.pub | pbcopy
	echo "(it's in your paste buffer)"
	read -p "Press Return to continue" etc
fi
ok brew gnupg
ok brew pinentry-mac