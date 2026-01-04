#! /bin/zsh

readonly PREFERENCES_PATH="/Users/${USER}/Library/Preferences"

function set_dock() {
    local -r DOCK_DOMAIN="${PREFERENCES_PATH}/com.apple.dock.plist"

    # Only show apps in use
    defaults delete "$DOCK_DOMAIN" "persistent-apps"
    defaults delete "$DOCK_DOMAIN" "persistent-others"
    defaults delete "$DOCK_DOMAIN" "recent-apps"

    defaults write "$DOCK_DOMAIN" autohide -int 1
    defaults write "$DOCK_DOMAIN" magnification -int 0
    defaults write "$DOCK_DOMAIN" "show-recents" -int 0
    defaults write "$DOCK_DOMAIN" tilesize -int 45

    # Delay Dock appearing, so acts as if Dock will never show
    defaults write "$DOCK_DOMAIN" autohide-delay -int 2
    # Remove Dock animation
    defaults write "$DOCK_DOMAIN" autohide-time-modifier -float 0.3

    # Restart Dock to reload settings
    killall Dock
}

function set_keyboard() {
    local -r INPUT_SOURCES_DOMAIN="${PREFERENCES_PATH}/com.apple.HIToolbox.plist"

    # Australian layout is the same as British but swaps '#' and '£'
    # After, '#': <S-3>, '£': <ALT-3>
    defaults write "$INPUT_SOURCES_DOMAIN" AppleEnabledInputSources -array-add '{
    InputSourceKind = "Keyboard Layout";
    "KeyboardLayout ID" = 15;
    "KeyboardLayout Name" = Australian;
    }'
    defaults write "$INPUT_SOURCES_DOMAIN" AppleCurrentKeyboardLayoutInputSourceID -string "com.apple.keylayout.Australian"

    # defaults write -g InitialKeyRepeat -int 25
    # defaults write -g KeyRepeat -int 4

    # For Monterey:
    defaults write com.apple.Accessibility KeyRepeatDelay "0.42"
    defaults write com.apple.Accessibility KeyRepeatInterval "0.1"
}

function set_shortcuts() {
    defaults write  -g NSUserKeyEquivalents '{
    "Lock Screen" = "@^l";
    }'
}

set_dock
set_keyboard
set_shortcuts

# Hide desktop icons
defaults write com.apple.finder CreateDesktop false
killall Finder
