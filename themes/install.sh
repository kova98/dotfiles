#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEMES_DIR="$HOME/.config/themes"
BIN_DIR="$HOME/.local/bin"

echo "Installing themes..."

# Create themes directory if it doesn't exist
mkdir -p "$THEMES_DIR"

# Copy all theme directories (excluding current, install.sh, and theme.sh)
for theme in "$SCRIPT_DIR"/*/ ; do
    theme_name=$(basename "$theme")
    if [ "$theme_name" != "current" ]; then
        echo "Copying theme: $theme_name"
        cp -r "$theme" "$THEMES_DIR/"
    fi
done

# Create bin directory if it doesn't exist
mkdir -p "$BIN_DIR"

# Copy theme.sh as executable 'theme'
echo "Installing theme script to $BIN_DIR/theme"
cp "$SCRIPT_DIR/theme.sh" "$BIN_DIR/theme"
chmod +x "$BIN_DIR/theme"

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    echo ""
    echo "Warning: $BIN_DIR is not in your PATH"
    echo "Add this to your ~/.bashrc or ~/.zshrc:"
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo ""
fi

# Set catpuccin as the current theme
echo "Setting catpuccin as current theme..."
"$BIN_DIR/theme" catpuccin

echo "Installation complete!"
