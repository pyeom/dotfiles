#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
HOME_DIR="$HOME"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

info()    { echo -e "${GREEN}[dotfiles]${NC} $*"; }
warn()    { echo -e "${YELLOW}[dotfiles]${NC} $*"; }
error()   { echo -e "${RED}[dotfiles]${NC} $*"; }

backup_and_link() {
    local src="$1"
    local dest="$2"

    # If dest is already a symlink pointing to src, skip
    if [ -L "$dest" ] && [ "$(readlink -f "$dest")" = "$(readlink -f "$src")" ]; then
        info "Already linked: $dest"
        return
    fi

    # Backup existing file/dir
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        warn "Backing up existing: $dest -> $dest.bak"
        mv "$dest" "$dest.bak"
    elif [ -L "$dest" ]; then
        warn "Removing stale symlink: $dest"
        rm "$dest"
    fi

    mkdir -p "$(dirname "$dest")"
    ln -sf "$src" "$dest"
    info "Linked: $dest -> $src"
}

# Link .config subdirectories
info "Linking config directories..."
for src in "$DOTFILES_DIR/.config"/*/; do
    dir_name="$(basename "$src")"
    backup_and_link "$src" "$CONFIG_DIR/$dir_name"
done

# Link home dotfiles from home/ directory
if [ -d "$DOTFILES_DIR/home" ]; then
    info "Linking home dotfiles..."
    for src in "$DOTFILES_DIR/home"/.*  "$DOTFILES_DIR/home"/*; do
        [ -e "$src" ] || continue
        dotfile="$(basename "$src")"
        backup_and_link "$src" "$HOME_DIR/$dotfile"
    done
fi

info "Done! All dotfiles linked."
