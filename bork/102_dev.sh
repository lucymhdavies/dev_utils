#!/usr/bin/env bork satisfy
# BORK_CONTEXT: HOME

ok mas 497799835 Xcode
did_install && xcode-select --install
did_install && sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer/



#
# Some useful Ruby Gems
#

ok brew ruby
ok gem bundler
ok gem jekyll



# TODO: Staticli
# https://github.com/staticli/staticli/issues/60

ok brew-tap hashicorp/tap
ok brew terraform-ls
ok brew terraform

# Cobra!
ok check "go get github.com/spf13/cobra/cobra"


# https://github.com/hashicorp/vault/issues/10645
# ok brew vault
# TODO: At least check for its existence for now

