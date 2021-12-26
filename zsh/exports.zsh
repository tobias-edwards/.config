# Volta
export VOLTA_HOME=$HOME/.volta

# $path is an array variable tied to $PATH scalar
path+=($VOLTA_HOME/bin)

export PATH

# Use neovim everywhere else e.g. git rebase -i
export EDITOR="nvim"
