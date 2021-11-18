#######################################
# Colors
#######################################
typeset -gA theme_gruvbox_material_dark
theme_gruvbox_material_dark=(
    fg0              '#d4be98' # '223'
    fg1              '#ddc7a1' # '223'
    red              '#ea6962' # '167'
    orange           '#e78a4e' # '208'
    yellow           '#d8a657' # '214'
    green            '#a9b665' # '142'
    aqua             '#89b482' # '108'
    blue             '#7daea3' # '109'
    purple           '#d3869b' # '175'
    bg_red           '#ea6962' # '167'
    bg_green         '#a9b665' # '142'
    bg_yellow        '#d8a657' # '214'
    grey0            '#7c6f64' # '243'
    grey1            '#928374' # '245'
    grey2            '#a89984' # '246'
)

#######################################
# pure
#######################################
zstyle ":prompt:pure:path" color "$theme_gruvbox_material_dark[aqua]"

zstyle ":prompt:pure:git:branch" color "$theme_gruvbox_material_dark[purple]"
zstyle ":prompt:pure:git:dirty" color "$theme_gruvbox_material_dark[fg0]"
zstyle ":prompt:pure:git:action" color "$theme_gruvbox_material_dark[yellow]"

zstyle ":prompt:pure:virtualenv" color "$theme_gruvbox_material_dark[fg1]"

zstyle ":prompt:pure:prompt:error" color "$theme_gruvbox_material_dark[fg0]"
zstyle ":prompt:pure:prompt:success" color "$theme_gruvbox_material_dark[fg0]"
zstyle ":prompt:pure:prompt:continuation" color "$theme_gruvbox_material_dark[fg0]"

#######################################
# zsh-syntax-highlighting
#######################################
# Adapted from https://github.com/dracula/zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

## General
### Diffs
### Markup
## Classes
## Comments
ZSH_HIGHLIGHT_STYLES[comment]="fg=${theme_gruvbox_material_dark[grey1]}"
## Constants
## Entitites
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]="fg=${theme_gruvbox_material_dark[green]}"
ZSH_HIGHLIGHT_STYLES[suffix-alias]="fg=${theme_gruvbox_material_dark[green]}"
ZSH_HIGHLIGHT_STYLES[global-alias]="fg=${theme_gruvbox_material_dark[green]}"
ZSH_HIGHLIGHT_STYLES[function]="fg=${theme_gruvbox_material_dark[green]}"
ZSH_HIGHLIGHT_STYLES[command]="fg=${theme_gruvbox_material_dark[green]}"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=${theme_gruvbox_material_dark[green]},italic"

ZSH_HIGHLIGHT_STYLES[autodirectory]="fg=${theme_gruvbox_material_dark[orange]},italic"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=${theme_gruvbox_material_dark[orange]}"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=${theme_gruvbox_material_dark[orange]}"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=${theme_gruvbox_material_dark[orange]}"
## Keywords
## Built ins
ZSH_HIGHLIGHT_STYLES[builtin]="fg=${theme_gruvbox_material_dark[yellow]}"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=${theme_gruvbox_material_dark[orange]}"
ZSH_HIGHLIGHT_STYLES[hashed-command]="fg=${theme_gruvbox_material_dark[yellow]}"
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=${theme_gruvbox_material_dark[fg0]}"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]="fg=${theme_gruvbox_material_dark[fg0]}"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]="fg=${theme_gruvbox_material_dark[fg0]}"
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]="fg=${theme_gruvbox_material_dark[fg0]}"

ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]="fg=${theme_gruvbox_material_dark[fg0]}"
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]="fg=${theme_gruvbox_material_dark[fg0]}"
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]="fg=${theme_gruvbox_material_dark[fg0]}"
## Serializable / Configuration Languages
## Storage
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]="fg=${theme_gruvbox_material_dark[green]}"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]="fg=${theme_gruvbox_material_dark[green]}"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=${theme_gruvbox_material_dark[green]}"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]="fg=${theme_gruvbox_material_dark[red]}"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=${theme_gruvbox_material_dark[green]}"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]="fg=${theme_gruvbox_material_dark[red]}"
ZSH_HIGHLIGHT_STYLES[rc-quote]="fg=${theme_gruvbox_material_dark[green]}"
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=${theme_gruvbox_material_dark[blue]}"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]="fg=${theme_gruvbox_material_dark[red]}"
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=${theme_gruvbox_material_dark[blue]}"
ZSH_HIGHLIGHT_STYLES[assign]="fg=${theme_gruvbox_material_dark[blue]}"
ZSH_HIGHLIGHT_STYLES[named-fd]="fg=${theme_gruvbox_material_dark[blue]}"
ZSH_HIGHLIGHT_STYLES[numeric-fd]="fg=${theme_gruvbox_material_dark[blue]}"
## No category relevant in spec
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=${theme_gruvbox_material_dark[red]}"
ZSH_HIGHLIGHT_STYLES[path]="fg=${theme_gruvbox_material_dark[aqua]}"
ZSH_HIGHLIGHT_STYLES[path_pathseparator]="fg=${theme_gruvbox_material_dark[aqua]}"
ZSH_HIGHLIGHT_STYLES[path_prefix]="fg=${theme_gruvbox_material_dark[aqua]}"
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]="fg=${theme_gruvbox_material_dark[aqua]}"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=${theme_gruvbox_material_dark[aqua]}"
ZSH_HIGHLIGHT_STYLES[history-expansion]="fg=${theme_gruvbox_material_dark[aqua]}"
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]="fg=${theme_gruvbox_material_dark[red]}"
ZSH_HIGHLIGHT_STYLES[redirection]="fg=${theme_gruvbox_material_dark[orange]}"
ZSH_HIGHLIGHT_STYLES[arg0]="fg=${theme_gruvbox_material_dark[orange]}"
ZSH_HIGHLIGHT_STYLES[default]="fg=${theme_gruvbox_material_dark[orange]}"
ZSH_HIGHLIGHT_STYLES[cursor]='standout'
