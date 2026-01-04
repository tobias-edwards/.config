# -U - mark the function for autoloading and suppress alias expansion
# -z - use zsh

# Provide colour names and escape strings, see `echo ${(o)color}`
autoload -Uz colors && colors

# # Make Homebrew's completions available to zsh (must be done before compinit)
# if type brew &>/dev/null
# then
#   FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
# fi

# Git tab completion
autoload -Uz compinit && compinit
