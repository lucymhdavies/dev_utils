#!/bin/bash

echo Setting identity

git config --global user.name  Lucy Davies
git config --global user.email lucy@lucymhdavies.com

echo
echo Setting signing key

# Sign as keybase.io/lmhd
git config --global user.signingkey E334C5E2

# Autosign
git config --global commit.gpgsign true

# Instaling dependencies for passwordless gpg...
brew install gpg-agent #pinentry-mac

echo
echo "Now import your key!"
echo
echo "See https://github.com/pstadler/keybase-gpg-github for more info"
echo "and install https://gpgtools.org/#gpgsuite too"
