alias v="nvim"
alias vi="nvim"

# Quickly source zshrc
alias s="source ~/.zshrc"

# Browser aliases
alias chrome='open -a "Google Chrome"'
alias edge='open -a "Microsoft Edge"'
alias firefox='open -a "Firefox"'
# alias firefoxd='open -a "Firefox Developer Edition"'
alias opera='open -a "Opera"'
alias safari='open -a "Safari"'

# Use podman as a replacement for docker due to business license changes
# alias docker="podman"

# Clear and erase scrollback
alias clear!="clear && printf '\e[3J'"

# alias aws-mfa-prod="export AWS_PROFILE=metaview-prod && aws-mfa --duration 43200"
# alias aws-mfa-terraform="export AWS_PROFILE=metaview-terraform && aws-mfa --duration 43200"
# alias aws-mfa-alpha="export AWS_PROFILE=metaview-alpha && aws-mfa --duration 43200"

# kubectl
alias k="kubectl"
alias eks-01="k config use-context eks-01"
alias eks-02="k config use-context eks-02"

function kns() {
  if [ -z "$1" ]; then
    kubectl config get-contexts
  else
    # Check if namespace exists
    if kubectl get namespace "$1" &> /dev/null; then
      kubectl config set-context --current --namespace="$1"
      echo "Switched to namespace: $1"
    else
      echo "Error: Namespace '$1' does not exist." >&2
    fi
  fi
}

# Kill listening processes at a given port
function killp() {
    kill -9 $(lsof -t -i:"$1" -sTCP:LISTEN)
}

# main-etl
alias uvsh='source .venv/bin/activate'
