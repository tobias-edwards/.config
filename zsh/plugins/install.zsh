source "${ZDOTDIR}/utils.zsh"

local PLUGIN_CONFIG="${ZDOTDIR}/plugins/config"

zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

zsh_add_file "${PLUGIN_CONFIG}/zsh-async.zsh"
zsh_add_plugin "mafredri/zsh-async"

zsh_add_file "${PLUGIN_CONFIG}/pure.zsh"
zsh_add_plugin "tobias-edwards/pure"

zsh_add_file "${PLUGIN_CONFIG}/zsh-vi-mode.zsh"
zsh_add_plugin "jeffreytse/zsh-vi-mode"

zsh_add_plugin "zsh-users/zsh-autosuggestions"

zsh_add_file "${PLUGIN_CONFIG}/git.zsh"

# Deno
if [ ! -s "$HOME/.deno/bin/deno" ]; then
    curl -fsSL https://deno.land/x/install/install.sh | sh
fi

# Rust and cargo
if [[ ! -s "$HOME/.cargo/bin/cargo" || ! -s "$HOME/.cargo/bin/rustc" ]] then
  curl https://sh.rustup.rs -sSf | sh;
fi

# Volta
if [ ! -s "$HOME/.volta/bin/volta" ]; then
    # Run installer but handle Volta setup manually (not currently supported on Windows)
    curl "https://get.volta.sh" | bash -s -- --skip-setup
fi

