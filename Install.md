# How to install all this crap

WIP. Being updated as I set up my new (LOL) MacBook.



## [X] Get SSH keys in place

Instructions TODO (I cloned these over from backup)



## [X] Clone git repo to ~/git_src/dev_utils

```
mkdir ~/git_src
cd  ~/git_src
git clone git@github.com:lucymhdavies/dev_utils.git
```


## [X] Git Config (initial)

```
git config --global user.name "Lucy Davinhart"
git config --global user.email lucy@lucymhdavies.com
git config --global core.excludesfile ~/.gitignore_global
```

``
ln -s ~/git_src/dev_utils/env/gitignore_global ~/.gitignore_global
``



## [ ] Git GPG

TODO

see https://github.com/pstadler/keybase-gpg-github

also ~/git_src/dev_utils/git script




## [X] Symlink bash_aliases

```
ln -s ~/git_src/dev_utils/env/bash_aliases ~/.bash_aliases
```



## [X] Update bashrc to source bash_aliases

```
touch ~/.bashrc
ln -s ~/.bashrc ~/.bash_profile
```

TODO: Save a template bashrc to git repo. For now, add:

```
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
        #GIT_PROMPT_ONLY_IN_REPO=1
        GIT_PROMPT_THEME=Solarized
        GIT_PROMPT_START="_LAST_COMMAND_INDICATOR_ ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]"
        GIT_PROMPT_END=""
        GIT_PROMPT_FETCH_REMOTE_STATUS=1
        source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_box_specific ]; then
    . ~/.bash_box_specific
fi
```


## [ ] Set up Bash Box Specific

TODO. Git repo with box-specific bashrc



## [ ] Brew Install All The Things

Install brew: https://brew.sh/

WIP. Being expanded as I find stuff.

```
brew install coreutils
brew install thefuck
brew install watch
brew install go
brew install bash-git-prompt
brew install jq
brew install fzf
brew install gnu-sed
brew install wget
brew upgrade bash
```

## [ ] Update Bash

See: https://itnext.io/upgrading-bash-on-macos-7138bd1066ba



## [X] iTerm

Download from https://www.iterm2.com/

Keep in dock

Menu > iTerm > Preferences
Load preferences from a custom folder or URL:
https://raw.githubusercontent.com/lucymhdavies/dev_utils/master/iterm/com.googlecode.iterm2.plist

Quit

Menu > iTerm > Preferences
Load preferences from a custom folder or URL:
~/git_src/dev_utils/iterm

Save changes to folder when iTerm2 quits

Save Current Settings to Folder

Quit


Commit any changes

```
cd ~/git_src/dev_utils/iterm
```





## [X] Screenrc

```
ln -s ~/git_src/dev_utils/env/screenrc ~/.screenrc
```



## [X] Vim

Get a newer version

```
brew install vim
```

Pathogen, and other plugins

```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go

go get github.com/nsf/gocode
~/go/src/github.com/nsf/gocode/vim/symlink.sh

git clone https://github.com/hashivim/vim-terraform ~/.vim/bundle/vim-terraform

git clone git@github.com:fatih/vim-hclfmt.git ~/.vim/bundle/vim-hclfm

git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes

git clone git@github.com:martinda/Jenkinsfile-vim-syntax.git ~/.vim/bundle/Jenkinsfile-vim-syntax
```


```
ln -s ~/git_src/dev_utils/env/vimrc ~/.vimrc
```


Maybe more?




## [X] TMP dir

Just create the dir for now.
Crons will sort the rest

```
mkdir ~/tmp
```

Add to favourites, then add to dock



## [X] Crons

```
crontab ~/git_src/dev_utils/cron/crontab
```

Maybe more?




## [X] Keybase

Install from https://keybase.io/

Use another device to add

Enable kbfs from UI

Check for success with:

```
ls /keybase/private/lmhd/
```


## [X] Docker

https://docs.docker.com/docker-for-mac/install/

Verify with

```
docker run hello-world
```



## [X] Lucli and Staticli

Download from https://github.com/LMHD/lucli/releases and https://github.com/staticli/staticli/releases

Install to ~/bin

Verify with

```
lucli version
staticli version

lucli awscli --shell
# press up, or
> --profile lmhd_root route53 list-hosted-zones | jq .
```


## Update XCode

Install XCode (app store)

```
xcode-select --install
```

or

```
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer/
```


## [ ] Random Go Binaries

```
go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/rakyll/gotest
```




## [ ] Automator Workflows?









## [ ] VS Code



## [X] Photoshop

Download from https://creativecloud.adobe.com/apps/all/photoshop/installation




## Install other things
some of these, use mas-cli?

* [X] LastPass - keep in dock
* [X] Chrome - keep in dock
* [X] Magnet
* [x] Disk Map
* [X] Franz - keep in dock
* [X] Macdown - `brew cask install macdown`
* [X] iStat Menu
* [ ] Clipboard history tool - https://clipy-app.com/ ?
* [ ] Photoshop

