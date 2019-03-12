#
# Bookmarked Directories
#

# Append new directory to top of bookmark list

function cdsa() {
	# Ensure the file exists
	echo "" >> ~/tmp/cdb

	# Append current directory to bookmark file
	# TODO linux version of this
	gsed -i "1i$PWD" ~/tmp/cdb

	# Remove dupes
	cat ~/tmp/cdb | awk '!x[$0]++' > ~/tmp/cdb-dedup
	mv ~/tmp/cdb-dedup ~/tmp/cdb
}


# CD to Saved directory
function cds() {
	if [ ! -f ~/tmp/cdb ]; then
		echo "Directory Bookmarks file does not exist. Add some with cdsa"
		return
	fi

	if [[ "$@" == "" ]]; then
		# Awk command prints unique lines only
		# https://stackoverflow.com/a/11532197
		f=$(cat ~/tmp/cdb | fzf --reverse -i)
	else
		f=$(cat ~/tmp/cdb | fzf --reverse -i -q "$@")
	fi

	if [ -d "$f" ]; then
		cd $f

		# Move most recently visited directory to top of list
		cdsa

		return
	fi
	if [ -f "$f" ]; then
		cd $(dirname $f)
		return
	fi
}

alias vicds="vi ~/tmp/cdb"
alias cdsvi=vicds
