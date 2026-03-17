# Installation notes

## SSH key

1. Generate SSH key on new device. Before cloning, add `github.com` as a known host:

```zsh
ssh-keyscan github.com >> ~/.ssh/known_hosts
```

2. Generate SSH key using email:

```zsh
ssh-keygen -t ed25519 -C "your_email@example.com"
```

3. Copy SSH key from and paste to GitHub: `cat id_ed25519.pub`

## Git

1. Use company and personal email in `.config/git` (create `.config/git/config.local`).

2. Configure Git:

```zsh
git config --global user.email "email@goes.here"
git config --global user.name "Homer Simpson"
```

## Installation

```zsh
cd ~/.config
zsh ./install.sh
```

Install binaries, and then launch Neovim:

```zsh
mise install
vim
```

## Keyboard

Remove all keyboard shortcuts except:

- Move focus to next window: `Alt + Tab`
- Accessibilty: `Cmd + F5`
- Map Caps key -> Ctrl
- Input source: `Australian`

## Applications

### Slack

Appearence:

```
#d4be98, #7c6f64, #7c6f64, #a9b665
```

### Phoenix

Give permissions and set as login item.

### Bartender

Give permissions and set as login item.

### Raycast

Give permissions and set as login item.

Configure `CMD+Space` to launch.

```
npm i -g vscode-langservers-extracted graphql-language-service-cli
```

## Existing `.config`?

Clone into `temp/`, move all files from `temp/` into `.config/`, and then move hidden files. After, remove empty `temp/`.
