ZVM_VI_INSERT_ESCAPE_BINDKEY='jk'

function zvm_after_init() {
    # Dynamically bind 'kj' also, see https://github.com/jeffreytse/zsh-vi-mode/issues/79
    zvm_bindkey viins 'kj' zvm_exit_insert_mode

    # Accept zsh-autosuggestions with Ctrl + e
    zvm_bindkey viins '^e' autosuggest-accept
}
