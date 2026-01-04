# Tridactyl

## Configuration

Install the native messenger:

```
:native
:nativeinstall
```

Source the config file (should be picked up automatically):

```
:source ~/.config/tridactyl/tridactylrc
```

View config:

```
:viewconfig
```

Saving config changes:

Copy the current configuration to the clipboard and paste here. `:mktridactylrc -f ~/.config/tridacyl/tridactylrc` doesn't seem to work (`-f` to overwrite, else if the file exists nothing will happen).

```
:mktridactylrc --clipboard
```
