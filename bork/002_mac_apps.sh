#!/usr/bin/env bork satisfy
# BORK_CONTEXT: EVERYWHERE

DEV_UTILS_DIR=$HOME/git_src/dev_utils
DEV_UTILS_PRIVATE_DIR=$HOME/git_src/dev_utils_private



#
# Common Utils, and stuff referenced in Bash Aliases
#

ok brew mas

ok brew watch
ok brew go
ok brew jq
ok brew yq
ok brew fzf
ok brew gnu-sed
ok brew wget
ok brew htop
ok brew tree
ok brew gron
ok brew gh

ok brew-tap teamookla/speedtest
ok brew speedtest


#
# Mac Apps
#

ok mas 1153157709 Speedtest
ok mas 937984704 Amphetamine
ok mas 467040476 HiddenMe
ok mas 425424353 TheUnarchiver

#
# Other useful apps
#
ok cask airserver
ok cask keybase
ok cask yubico-yubikey-manager
ok cask mos
ok cask raycast
ok brew displayplacer

#
# Mouse
#
ok cask logi-options+
# TODO: Logi settings
# pointer speed
# gestures


ok brew-tap heroku/brew
ok brew heroku




#
# Stuff currently broken
#

# https://docs.docker.com/docker-for-mac/apple-m1/
# ok cask docker
ok check "bork check which docker"
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

#
# Initial Git Config
#

ok symlink $HOME/.gitignore_global $DEV_UTILS_DIR/env/gitignore_global

# Auto-Git Config for Fronters
ok directory $HOME/.config/lmhd
ok symlink $HOME/.config/lmhd/git_users.json $DEV_UTILS_DIR/git/git_users.json

# Default branch for new git repos
ok check "git config --global init.defaultBranch main"
ok check "git config --global core.excludesfile ~/.gitignore_global"


# TODO: check if this is already there before running it
#ok check "git config --global --add --bool push.autoSetupRemote true"

# TODO: Other Git Config?


#
# Temporary Directory
#

ok directory "$HOME/tmp"

# TODO: Add to favourites in finder
# TODO: Add to dock






#
# Ghostty
#

ok cask ghostty@tip
ok directory $HOME/.config/ghostty
ok symlink  $HOME/.config/ghostty/config $DEV_UTILS_DIR/ghostty/config
ok symlink  $HOME/.config/ghostty/themes $DEV_UTILS_DIR/ghostty/themes

# TODO: remove, if it exists "$HOME/Library/Application Support/com.mitchellh.ghostty/config"


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
	# TODO: can I do this programatically?


	read -p "Press Return to launch vim" etc
	vim

	echo "Should be done!"
fi
ok check "go install golang.org/x/tools/cmd/goimports@latest"

# Vim Terraform
ok github $HOME/.vim/bundle/vim-terraform hashivim/vim-terraform --branch=master --ssh

# Vim HCLfmt
ok github $HOME/.vim/bundle/vim-hclfmt fatih/vim-hclfmt --branch=master --ssh
ok check "go install github.com/2nick/hclfmt@latest"

# Vim Airline
ok github $HOME/.vim/bundle/vim-airline vim-airline/vim-airline --branch=master --ssh
ok github $HOME/.vim/bundle/vim-airline-themes vim-airline/vim-airline-themes --branch=master --ssh

# VIM Sentinel
ok github $HOME/.vim/bundle/sentinel.vim hashicorp/sentinel.vim --branch=master --ssh

# VIM Nomad
ok github $HOME/.vim/bundle/vim-nomadproject hashivim/vim-nomadproject --branch=master --ssh





#
# Git
#

ok brew git-secrets
# TODO: auto-install
# https://github.com/awslabs/git-secrets#id10

# TODO: check if all repos have it configured maybe?


# Important Cask Stuff
ok cask discord



#
# Elgato Stream Deck

#
ok cask elgato-stream-deck
# TODO: elgato config
# Somewhere in ~/Library/Application Support/com.elgato.StreamDeck
