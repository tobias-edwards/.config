function zsh_add_file() {
    [ -f $1 ] && source $1
}

# Clone and source GitHub plugin
function zsh_add_plugin() {
    local PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    local PLUGIN_PATH="${ZDOTDIR}/plugins/installed/${PLUGIN_NAME}"

    if [ ! -d $PLUGIN_PATH ]; then
        git clone "https://github.com/${1}.git" $PLUGIN_PATH
    fi
    zsh_add_file "${PLUGIN_PATH}/${PLUGIN_NAME}.zsh"
}
