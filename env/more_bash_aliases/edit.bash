function edit() {
	editor=$(echo -e "code\nvim -p" | fzf --no-height --reverse)
	$editor $@
}

alias vi=edit
