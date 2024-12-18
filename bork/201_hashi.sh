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

# https://28mm.github.io/blast-radius-docs/
ok brew graphviz
# TODO: figure out what's going on here
#ok pip3 blastradius
#
# it installs fine, but...
#
# missing: pip3 blastradius
# DEPRECATION: Configuring installation scheme with distutils config files is deprecated and will no longer work in the near future. If you are using a Homebrew or Linuxbrew Python, please see discussion at https://github.com/Homebrew/homebrew-core/issues/76621
# Requirement already satisfied: blastradius in /usr/local/lib/python3.9/site-packages (0.1.23)
# Requirement already satisfied: jinja2 in /usr/local/lib/python3.9/site-packages (from blastradius) (3.0.1)
# Requirement already satisfied: pyhcl>=0.3.10 in /usr/local/lib/python3.9/site-packages (from blastradius) (0.4.4)
# Requirement already satisfied: Flask in /usr/local/lib/python3.9/site-packages (from blastradius) (2.0.1)
# Requirement already satisfied: requests in /usr/local/lib/python3.9/site-packages (from blastradius) (2.26.0)
# Requirement already satisfied: BeautifulSoup4 in /usr/local/lib/python3.9/site-packages (from blastradius) (4.10.0)
# Requirement already satisfied: soupsieve>1.2 in /usr/local/lib/python3.9/site-packages (from BeautifulSoup4->blastradius) (2.2.1)
# Requirement already satisfied: itsdangerous>=2.0 in /usr/local/lib/python3.9/site-packages (from Flask->blastradius) (2.0.1)
# Requirement already satisfied: Werkzeug>=2.0 in /usr/local/lib/python3.9/site-packages (from Flask->blastradius) (2.0.1)
# Requirement already satisfied: click>=7.1.2 in /usr/local/lib/python3.9/site-packages (from Flask->blastradius) (8.0.1)
# Requirement already satisfied: MarkupSafe>=2.0 in /usr/local/lib/python3.9/site-packages (from jinja2->blastradius) (2.0.1)
# Requirement already satisfied: idna<4,>=2.5 in /usr/local/lib/python3.9/site-packages (from requests->blastradius) (3.2)
# Requirement already satisfied: urllib3<1.27,>=1.21.1 in /usr/local/lib/python3.9/site-packages (from requests->blastradius) (1.26.6)
# Requirement already satisfied: certifi>=2017.4.17 in /usr/local/lib/python3.9/site-packages (from requests->blastradius) (2021.5.30)
# Requirement already satisfied: charset-normalizer~=2.0.0 in /usr/local/lib/python3.9/site-packages (from requests->blastradius) (2.0.5)
# verifying : pip3 blastradius
# *  failed
# missing

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
