#
# Find Repo and Change Directory
#


# kick off an initial frd today if we do not have one yet
frd-background

function frcd() {
	tmpdir=/tmp/lmhd/dev-utils/

	# Find all directories which contain a ".git" directory
	if [[ ! -f "${tmpdir}/frcd" ]]; then
		echo "loading..."
		frd
	fi

	f=$(cat ${tmpdir}/frcd | fzf --reverse -i -q "$@")
	# TODO: allow user to specify no parameter

	if [ -d "$f" ]; then
		cd $f
		return
	fi
	if [ -f "$f" ]; then
		cd $(dirname $f)
		return
	fi
}
