# How to install all this crap

WIP. Being updated as I set up my new (LOL) MacBook.


## Bootstrap

Install Homebrew:

* https://brew.sh/

Once installed, install Bork

```
brew install bork
```

## Bork!

Get initial stuff in place:

```
bork satisfy git_src/dev_utils/bork/000_init_mac.sh
```

The rest, can be done later:

```
bork satisfy git_src/dev_utils/bork/*.sh
```








# Old Stuff


## [X] Git Config (initial)

```
git config --global user.name "Lucy Davinhart"
git config --global user.email lucy@lucymhdavies.com
git config --global core.excludesfile ~/.gitignore_global
git config --global init.defaultBranch main
```



## [ ] Git GPG

TODO

see https://github.com/pstadler/keybase-gpg-github

also ~/git_src/dev_utils/git script






## [ ] K8s Prompt

Install https://github.com/jonmosco/kube-ps1

```
brew install kube-ps1
```

Add to prompt:

```
	export GIT_PROMPT_START_USER=${GIT_PROMPT_START_USER}\ '$(kube_ps1)'
```









## [X] Vim


Pathogen, and other plugins

```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go

git clone https://github.com/hashivim/vim-terraform ~/.vim/bundle/vim-terraform

git clone git@github.com:fatih/vim-hclfmt.git ~/.vim/bundle/vim-hclfm

git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes

```





## [X] Staticli

Download from https://github.com/staticli/staticli/releases

Install to ~/bin

Verify with

```
staticli version
```