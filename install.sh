#! /bin/zsh

# Prepare ~/.zshrc
cp -a ./root/. ~

function command_exists {
    local name=$1
    # NOTE: Return status from a shell function is the return status of the last statement executed
    type $name &> /dev/null
}

if ! command_exists brew; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

brew install \
    awscli \
    deno \
    git-delta \
    gh \
    fzf \
    ripgrep \
    mysql \
    tmux \
    lua-language-server \
    scroll-reverser \
    kubectl \
    kustomize \
    colima \
    wget

# Plantuml
mise use -g java
brew install graphviz
brew install plantuml

brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew install luarocks

brew install --cask nikitabobko/tap/aerospace
# NOTE: Post Phoenix install, manually open it and enable `Accessibility` access
brew install --cask \
    bartender \
    raycast \
    buttercup \
    phoenix \
    firefox \
    google-chrome
    # keepingyouawake \

# NOTE: Support Alacritty on macOS, see https://github.com/alacritty/alacritty/issues/4673#issuecomment-771291615
brew install --cask alacritty --no-quarantine
# curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

brew tap homebrew/cask-fonts
brew install --cask font-dejavu-sans-mono-nerd-font font-hack-nerd-font

echo -e "\e[0mRegular\e[1mBold\e[0;3mItalic\e[0;1;3mBoldItalic\e[0m"

# TODO: Check if works on macOS, doesn't seem to work!
# git clone https://github.com/alb12-la/KBOS
# cd KBOS
# zsh ./setup.sh

# TODO: tmux-256 color for macOS, see https://gist.github.com/bbqtd/a4ac060d6f6b9ea6fe3aabe735aa9d95 if not automatically working

# TODO: Scroll reverser: https://github.com/pilotmoon/Scroll-Reverser
# - Hide in menu bar
# - Start at login
# - Scrolling Axes:
#   - Reverse Vertical
# - Scrolling Devices:
#   - Reverse Mouse

# Mise
curl https://mise.run | sh
mise use -g neovim@stable

# Rust and cargo
if [[ ! -s "$HOME/.cargo/bin/cargo" || ! -s "$HOME/.cargo/bin/rustc" ]] then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

cargo install stylua
cargo install git-delta
