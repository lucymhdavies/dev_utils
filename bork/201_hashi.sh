#!/usr/bin/env bork satisfy
# BORK_CONTEXT: EVERYWHERE

# The HashiCorp Stack, and other helpful tools


#
# Terraform
#

ok brew-tap hashicorp/tap
ok brew terraform-ls
ok brew terraform --from=hashicorp/tap
if satisfying ; then
	terraform -install-autocomplete
fi

ok brew awscli
ok brew azure-cli
ok cask google-cloud-sdk


#
# Others
#

ok brew vault --from=hashicorp/tap
# TODO: tab completion

ok brew vlt --from=hashicorp/tap

ok brew consul --from=hashicorp/tap

ok brew nomad --from=hashicorp/tap
# TODO: tab completion
#complete -C /usr/local/bin/nomad nomad

ok brew boundary --from=hashicorp/tap
ok cask hashicorp-boundary-desktop

ok brew waypoint --from=hashicorp/tap

ok cask vagrant --from=hashicorp/tap

ok brew packer --from=hashicorp/tap

ok brew sentinel --from=hashicorp/tap

ok brew hcp -from=hashicorp/tap

ok brew tfstacks -from=hashicorp/tap
