source "${ZDOTDIR}/utils.zsh"

local PLUGIN_CONFIG="${ZDOTDIR}/plugins/config"

zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

zsh_add_file "${PLUGIN_CONFIG}/zsh-async.zsh"
zsh_add_plugin "mafredri/zsh-async"

zsh_add_file "${PLUGIN_CONFIG}/pure.zsh"
zsh_add_plugin "sindresorhus/pure"

zsh_add_file "${PLUGIN_CONFIG}/zsh-vi-mode.zsh"
zsh_add_plugin "jeffreytse/zsh-vi-mode"

zsh_add_plugin "zsh-users/zsh-autosuggestions"

zsh_add_file "${PLUGIN_CONFIG}/git.zsh"

zsh_add_file "${PLUGIN_CONFIG}/bun-completions.zsh"
