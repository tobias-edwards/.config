# Ghostty journey

List of missing features before I switch to Ghostty.

## Application

- Inherits ugly rounded corners from macOS

## Splits

- Swapping/rotating splits. Ghostty cannot programmatically move splits around like in Tmux `<leader>{`, `<leader>}`
- Natively integrating with Neovim for navigation, like vim-tmux-navigator
- Navigation between splits doesn't consider recently navigated, isn't "spatial navigation"
  - https://github.com/ghostty-org/ghostty/pull/8210

## Tabs

- Tabs are massive and cannot be styled. GTK CSS is supported, but not for macOS. Ideally move tabs to the bottom. Can then hide the menu bar, too
- Tab names are automatic or manual, and cannot be set programmatically e.g. tabs can't be named the last part of `cwd`, for example

## Vim

- Basic Vim support:
  - https://github.com/ghostty-org/ghostty/discussions/3708
  - Doesn't support cursor navigation
  - Searching largely relies on "native" search like CMD+f and then using Enter to cycle through results
