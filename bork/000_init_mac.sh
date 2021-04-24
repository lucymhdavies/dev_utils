#!/usr/bin/env bork

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



#
# Rosetta
#

if [[ $(uname -p) == 'arm' ]] && [[ $(uname -s) == 'Darwin' ]]; then
	ok check "/usr/sbin/softwareupdate --install-rosetta --agree-to-license 2>/dev/null"
fi



#
# Bash and Dev Utils
#

ok brew bash
ok shells $(brew --prefix)/bin/bash
did_install && chsh -s $(brew --prefix)/bin/bash

ok brew git

ok directory "$HOME/git_src"
DEV_UTILS_DIR=$HOME/git_src/dev_utils
DEV_UTILS_PRIVATE_DIR=$HOME/git_src/dev_utils_private
ok github $DEV_UTILS_DIR lucymhdavies/dev_utils --branch=main --ssh
ok github $DEV_UTILS_PRIVATE_DIR lucymhdavies/dev_utils_private --branch=main --ssh

ok symlink $HOME/.bash_aliases      $DEV_UTILS_DIR/env/bash_aliases
ok symlink $HOME/.bashrc            $DEV_UTILS_DIR/env/bashrc
ok symlink $HOME/.screenrc          $DEV_UTILS_DIR/env/screenrc

ok symlink $HOME/.bash_box_specific $DEV_UTILS_PRIVATE_DIR/$(hostname)/bashrc_box_specific

ok symlink $HOME/.bash_profile $HOME/.bashrc



#
# Common Utils, and stuff referenced in Bash Aliases
#

ok brew mas
ok mas 497799835 Xcode
did_install && xcode-select --install
did_install && sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer/

ok brew coreutils
ok brew bash-git-prompt
ok brew thefuck
ok brew watch
ok brew go
ok brew jq
ok brew fzf
ok brew gnu-sed
ok brew wget
ok brew speedtest-cli
ok brew htop



#
# Some useful Ruby Gems
#

ok gem bundler
ok gem jekyll



#
# Stuff currently broken
#

# https://docs.docker.com/docker-for-mac/apple-m1/
# ok cask docker
ok check "docker run hello-world"
if check_failed && satisfying; then
	echo
	echo "========================================"
	echo "Install Docker"
	echo "========================================"

	echo Install manually from:
	echo https://docs.docker.com/docker-for-mac/apple-m1/
	read -p "Press Return to continue" etc
fi



#
# Manually isntalled binaries
#

ok directory "$HOME/bin"

ok check "[ -e $HOME/bin/lucli ]"
if check_failed && satisfying; then
	if [[ $(uname -p) == 'arm' ]] && [[ $(uname -s) == 'Darwin' ]]; then
		echo "Installing a version of lucli"
		lucli_url=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/LMHD/lucli/releases/download/0.18.1/lucli.darwin.arm64)
		ok download $HOME/bin/lucli ${lucli_url}
		ok check "chmod +x $HOME/bin/lucli"
	else
		# TODO: DO SOMETHING
		echo "Non M1. Not sure what do"
		exit 1
	fi
fi
ok check "$HOME/bin/lucli update"


# TODO: Staticli
# https://github.com/staticli/staticli/issues/60


#
# Initial Git Config
#

ok symlink $HOME/.gitignore_global $DEV_UTILS_DIR/env/gitignore_global


# TODO

# TODO: /Users/strawb/.config/lmhd/git_users.json



#
# Temporary Directory
#

ok directory "$HOME/tmp"

# TODO: Add to favourites in finder
# TODO: Add to dock



#
# iTerm
#

ok cask iterm2
if did_install; then
	echo
	echo "========================================"
	echo "Configure iTerm"
	echo "========================================"
	echo "Openning iTerm"
	open -a iterm

	echo
	echo "Menu > iTerm > Preferences"
	echo "Load preferences from a custom folder or URL:"
	echo "https://raw.githubusercontent.com/lucymhdavies/dev_utils/master/iterm/com.googlecode.iterm2.plist"
	echo -n "https://raw.githubusercontent.com/lucymhdavies/dev_utils/master/iterm/com.googlecode.iterm2.plist" | pbcopy
	echo "(it's in your paste buffer)"
	read -p "Press Return to continue" etc


	read -p "Press Return to kill iterm" etc
	killall iTerm2
	echo "Openning iTerm"
	open -a iterm


	echo
	echo "Menu > iTerm > Preferences"
	echo "Load preferences from a custom folder or URL:"
	echo "~/git_src/dev_utils/iterm"
	echo
	echo "Save changes to folder when iTerm2 quits"
	echo "Save Current Settings to Folder"
	read -p "Press Return to continue" etc


	read -p "Press Return to kill iterm" etc
	killall iTerm2
	echo "Openning iTerm"
	open -a iterm

	echo "Should be done!"
fi

# TODO: Keep In Dock
# TODO: Make iTerm default terminal




#
# Crons
#

ok check "crontab -l"
if check_failed && satisfying; then
	ok check "crontab $DEV_UTILS_DIR/cron/crontab"
fi


# TODO: Cronjob to do a bork check
# https://github.com/skylarmacdonald/bork/issues/20





#
# Vim
#

ok brew vim
ok symlink $HOME/.vimrc             $DEV_UTILS_DIR/env/vimrc
ok directory "$HOME/.vim/autoload"
ok directory "$HOME/.vim/bundle"

# Pathogen, for Vim Plutins https://github.com/tpope/vim-pathogen
pathogen_url=$(curl -Ls -o /dev/null -w %{url_effective} https://tpo.pe/pathogen.vim)
ok download $HOME/.vim/autoload/pathogen.vim ${pathogen_url}

# Vim Go
ok github $HOME/.vim/bundle/vim-go fatih/vim-go --branch=master --ssh
if did_install; then
	echo
	echo "========================================"
	echo "Need to run Vim Command"
	echo "========================================"
	echo "Open Vim then run: :GoInstallBinaries (it's in your paste buffer)"
	echo -n ":GoInstallBinaries" | pbcopy


	read -p "Press Return to launch vim" etc
	vim

	echo "Should be done!"
fi
ok check "go get -u golang.org/x/tools/cmd/goimports"

# Vim Terraform
ok github $HOME/.vim/bundle/vim-terraform hashivim/vim-terraform --branch=master --ssh

# Vim HCLfmt
ok github $HOME/.vim/bundle/vim-hclfmt fatih/vim-hclfmt --branch=master --ssh
ok check "go get -u github.com/fatih/hclfmt"

# Vim Airline
ok github $HOME/.vim/bundle/vim-airline vim-airline/vim-airline --branch=master --ssh
ok github $HOME/.vim/bundle/vim-airline-themes vim-airline/vim-airline-themes --branch=master --ssh



#
# Trust Vault Generated Certs
#

# Check if this cert is already in the keychain
ok check "security dump-trust-settings -s -d | grep lmhd.me"
if check_failed && satisfying; then
	# If not, download and trust
	ok download /tmp/lmhd_root.pem https://vault.lmhd.me/v1/pki_root/ca/pem
	ok check "sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain /tmp/lmhd_root.pem"
fi
