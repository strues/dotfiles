#!/usr/bin/env bash

################################################################################
# install
#
# This script symlinks the dotfiles into place in the home directory.
################################################################################

dotfiles_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n[DOTFILES] $fmt\n" "$@"
}

set -e # Terminate script if anything exits with a non-zero value
set -u # Prevent unset variables gitmessage hushlogin

files="Brewfile gemrc gitconfig gitignore_global npmrc zshrc"
DOTFILES_DIR=$HOME/.dotfiles

dotfiles_echo "Installing dotfiles..."

for file in $files; do
  if [ -f "$HOME/.$file" ]; then
    dotfiles_echo ".$file already present. Backing up..."
    cp "$HOME/.$file" "$HOME/.${file}_backup"
    rm -f "$HOME/.$file"
  fi
  dotfiles_echo "-> Linking $DOTFILES_DIR/$file to $HOME/.$file..."
  ln -nfs "$DOTFILES_DIR/$file" "$HOME/.$file"
done

if [ -d "$HOME"/.rbenv ]; then
  ln -nfs "$DOTFILES_DIR"/default-gems "$HOME"/.rbenv/default-gems
fi

dotfiles_echo "Dotfiles installation complete!"
dotfiles_echo "Complete Brew Bundle installation with 'brew bundle install -v --global'"
