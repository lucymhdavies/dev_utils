#
# Bookmarked Directories
#

# Append new directory to top of bookmark list

# TODO linux version of this
alias cdsa="gsed -i \"1i\$PWD\" ~/tmp/cdb"

# TODO: prune list when appending

# CD to Saved directory
function cds() {

	if [[ "$@" == "" ]]; then
		# Awk command prints unique lines only
		# https://stackoverflow.com/a/11532197
		f=$(cat ~/tmp/cdb | awk '!x[$0]++' | fzf --reverse -i)
	else
		f=$(cat ~/tmp/cdb | awk '!x[$0]++' | fzf --reverse -i -q "$@")
	fi

	if [ -d "$f" ]; then
		cd $f
		# TODO: move most recently visited directory to top of list
		return
	fi
	if [ -f "$f" ]; then
		cd $(dirname $f)
		return
	fi
}

alias vicds="vi ~/tmp/cdb"
alias cdsvi=vicds
