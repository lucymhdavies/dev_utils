#!/usr/bin/env bork satisfy
# BORK_CONTEXT: EVERYWHERE


#
# Terraform
#

ok brew-tap hashicorp/tap
ok brew terraform-ls
ok brew terraform

# https://28mm.github.io/blast-radius-docs/

ok brew graphviz
ok pip3 blastradius


#
# Vault
#

ok brew vault


