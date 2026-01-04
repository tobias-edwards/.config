# Notes dump

## Scan for Git leaks

## To clean up on the next installation

Slack appearence:

```
#d4be98, #7c6f64, #7c6f64, #a9b665
```

Use company email on ssh generation
Run install script, rerun it a couple of times, source .zshrc, rerunn install script, open vi a couple of times.

Remove all keyboard shortcuts (which may interfere with tmux, etc.) except:

- Move focus to next window - alt + tab
- Spotlight search - cmd + space
- Accessibilty - CMD + F5
- Map caps -> Ctrl
- Input source -> Australian

```
mise use -g node
npm i -g vscode-langservers-extracted graphql-language-service-cli
```

Existing .config?

1. Clone into `temp/`, move all files from `temp/` into `.config/`, and then move hidden files. After, remove empty `temp/`

Currently:

1. Generate SSH key on new device. Before cloning, add github.com as a known host:

`ssh-keyscan github.com >> ~/.ssh/known_hosts`
https://github.com/ome/devspace/issues/38#issuecomment-211515244

Setup at git email at company:

1. ssh-keygen -t ed25519 -C "your_email@example.com"

2. Copy SSH key from and paste to GitHub: `cat id_ed25519.pub`

3. Use company and personal email in `.config/git`
