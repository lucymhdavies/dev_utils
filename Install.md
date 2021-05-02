# How to install all this crap

WIP. Being updated as I set up my Mac Mini.


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




## [X] Staticli

Download from https://github.com/staticli/staticli/releases

Install to ~/bin

Verify with

```
staticli version
```
