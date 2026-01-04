# Volta
# export VOLTA_HOME=$HOME/.volta

export XDG_CONFIG_HOME=$HOME/.config
export BUN_HOME="$HOME/.bun"

# $path is an array variable tied to $PATH scalar
# path+=($VOLTA_HOME/bin)
path+=($HOME/.cargo/bin)
path+=(/opt/homebrew/bin)
path+=(/usr/local/bin)
path+=(/usr/local/bin)
path+=($BUN_HOME/bin)

# RVU
path+=(/opt/uswitch/bin)
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

# gow - Go watch-mode runner
path+=($HOME/go/bin)

# Go
export PATH=$PATH:/usr/local/go/bin

# Use neovim everywhere else e.g. git rebase -i
export EDITOR="nvim"

# Use Nvim as manpager - highlighting, wrapping, contents, etc.
export MANPAGER='nvim +Man!'
# Soft wrap lines i.e. allow lines to extend to full width of window before wrapping
export MANWIDTH=999

export PATH

# TODO: Not working perfectly with delta?
# export GIT_CONFIG_GLOBAL="$HOME/.config/.gitconfig"
# export GIT_CONFIG="$HOME/.config/.gitconfig"
