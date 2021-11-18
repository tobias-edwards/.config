# -U - mark the function for autoloading and suppress alias expansion
# -z - use zsh

# Provide colour names and escape strings, see `echo ${(o)color}`
autoload -Uz colors && colors

# Git tab completion
autoload -Uz compinit && compinit
