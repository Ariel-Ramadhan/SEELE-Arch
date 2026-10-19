#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

echo "Installing dotfiles..."

# Create .config if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Loop through directories in dotfiles/config
for dir in "$DOTFILES_DIR/config"/*; do
    target="$CONFIG_DIR/$(basename "$dir")"
    
    if [ -e "$target" ]; then
        echo "Backing up existing config: $target -> ${target}.bak"
        mv "$target" "${target}.bak"
    fi
    
    echo "Linking $dir to $target"
    ln -s "$dir" "$target"
done

echo "Done! Packages list available at $DOTFILES_DIR/packages.txt"
