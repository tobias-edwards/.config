# "cd .." - Ctrl + k
function cd_up() {
	BUFFER="cd .."
	zle accept-line
}
zle -N cd_up
bindkey "^k" cd_up
