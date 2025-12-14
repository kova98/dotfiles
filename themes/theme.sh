#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: theme <name>"
    echo "Available themes:"
    ls -1 "$HOME/.config/themes/" | grep -v "^current$" | sed 's/^/  - /'
    exit 1
fi

THEME="$1"
SOURCE="$HOME/.config/themes/$THEME"
DEST="$HOME/.config/themes/current"

if [ ! -e "$SOURCE" ]; then
    echo "Available themes:"
    ls -1 "$HOME/.config/themes/" | grep -v "^current$" | sed 's/^/  - /'
    exit 1
fi

# Copy theme to current
rm -rf "$DEST"
cp -r "$SOURCE" "$DEST"

cp "$DEST/btop.theme" "$HOME/.config/btop/themes/current.theme"

# Apply theme
restart-app() {
    pkill -x $1
    setsid uwsm-app -- $1 >/dev/null 2>&1 &
}

touch ~/.config/alacritty/alacritty.toml
restart-app waybar
restart-app btop

echo "Switched to '$THEME'. Looking good! "
