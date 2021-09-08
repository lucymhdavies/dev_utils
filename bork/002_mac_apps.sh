#!/usr/bin/env bork satisfy
# BORK_CONTEXT: EVERYWHERE



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
ok brew speedtest-cli
ok brew htop
ok brew tree
ok mas 1153157709 Speedtest



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

ok check "[ -e $HOME/bin/lucli ] && $HOME/bin/lucli version 2>/dev/null"
if check_failed && satisfying; then
	if [[ $(uname -p) == 'arm' ]] && [[ $(uname -s) == 'Darwin' ]]; then
		lucli_version=$(curl -s https://api.github.com/repos/LMHD/lucli/releases | jq -r .[0].name)
		echo "Installing latest version of lucli (${lucli_version})"
		lucli_url=https://github.com/LMHD/lucli/releases/download/${lucli_version}/lucli.darwin.arm64
		ok download $HOME/bin/lucli ${lucli_url}
		ok check "chmod +x $HOME/bin/lucli"
	else
		# TODO: DO SOMETHING
		echo "Non M1. Not sure what do"
		exit 1
	fi
fi
ok check "$HOME/bin/lucli update 2>/dev/null"

# TODO: lucli.yml


#
# Initial Git Config
#

ok symlink $HOME/.gitignore_global $DEV_UTILS_DIR/env/gitignore_global

# Auto-Git Config for Fronters
ok directory $HOME/.config/lmhd
ok symlink $HOME/.config/lmhd/git_users.json $DEV_UTILS_DIR/git/git_users.json

# TODO: Other Git Config?


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





# TODO: DNS
# https://1.1.1.1/dns/
