local ZSH="${CONFIG_DIR}/zsh"
source "${ZSH}/utils.zsh"

zsh_add_file "${ZSH}/aliases.zsh"
zsh_add_file "${ZSH}/exports.zsh"
zsh_add_file "${ZSH}/general.zsh"
zsh_add_file "${ZSH}/themes/gruvbox-material-dark.zsh"
zsh_add_file "${ZSH}/plugins/install.zsh"

# Activate mise and completions
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise completion zsh)"

# bun completions
[ -s "/Users/tobias/.bun/_bun" ] && source "/Users/tobias/.bun/_bun"
