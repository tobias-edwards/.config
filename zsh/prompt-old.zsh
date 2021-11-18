autoload -Uz add-zsh-hook vcs_info

# Fetch Git updates before each prompt is displayed
add-zsh-hook precmd vcs_info

# Array used by highlighters to declare user overridable styles.
typeset -gA ZSH_PROMPT_STYLES

: "${ZSH_PROMPT_STYLES[path]:=yellow}"
: "${ZSH_PROMPT_STYLES[branch]:=blue}"
: "${ZSH_PROMPT_STYLES[action]:=blue}"
: "${ZSH_PROMPT_STYLES[staged]:=green}"
: "${ZSH_PROMPT_STYLES[unstaged]:=red}"
: "${ZSH_PROMPT_STYLES[untracked]:=yellow}"

zstyle ':vcs_info:git:*' check-for-changes true

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep -q '^?? ' 2> /dev/null ; then
            local untracked_marker="%{$fg_bold[${ZSH_PROMPT_STYLES[untracked]}]%}?%{$reset_color%}"
            hook_com[unstaged]+=$untracked_marker
    fi
}

local path="%{$fg_bold[${ZSH_PROMPT_STYLES[path]}]%}%~%{$reset_color%}"
local git_branch="%{$fg_bold[${ZSH_PROMPT_STYLES[branch]}]%}(%b)%{$reset_color%}"
local git_action="%{$fg[${ZSH_PROMPT_STYLES[action]}]%}(%a)%{$reset_color%}"
local git_staged="%{$fg_bold[${ZSH_PROMPT_STYLES[staged]}]%}%c%{$reset_color%}"
local git_unstaged="%{$fg_bold[${ZSH_PROMPT_STYLES[unstaged]}]%}%u%{$reset_color%}"


# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:git:*' unstagedstr '!'
zstyle ':vcs_info:git:*' stagedstr '+'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats "${git_branch}${git_staged}${git_unstaged}"

zstyle ':vcs_info:git:*' actionformats "${git_branch}${git_action}${git_staged}${git_unstaged}"

PROMPT="${path}"

# Enable substitution in the prompt
setopt prompt_subst
PROMPT+=' $vcs_info_msg_0_'

# local NEWLINE=$'\n'
# PROMPT+="${NEWLINE}> "
PROMPT+=" ➜ "

# Edit prompts in another file like so:
# typeset -gA ZSH_PROMPT_STYLES
# ZSH_PROMPT_STYLES[path]=yellow
