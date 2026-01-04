# .config

A minimalist, Vim-centric environment powered by Neovim, Alacritty, tmux, Phoenix, and more.

![.config usage demo](./docs/demo.png)

## Installation

Compatible with macOS, can be installed by:

```zsh
cd ~
git clone git@github.com:tobias-edwards/.config.git
cd .config

# May need to rerun this a few times, and then open neovim a few times for installation to complete
zsh install.sh
```

## Development

```zsh
mise install        # Install gitleaks, pre-commit
pre-commit install  # Set up pre-commit hook
```
