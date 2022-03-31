# Volta
export VOLTA_HOME=$HOME/.volta

# $path is an array variable tied to $PATH scalar
path+=($VOLTA_HOME/bin)
path+=($HOME/.cargo/bin)

export PATH

# Use neovim everywhere else e.g. git rebase -i
export EDITOR="nvim"

# Use Nvim as manpager - highlighting, wrapping, contents, etc.
export MANPAGER='nvim +Man!'
# Soft wrap lines i.e. allow lines to extend to full width of window before wrapping
export MANWIDTH=999
