#!/usr/bin/env bash

################################################################################
# bootstrap
#
# Setup for a fresh MacOS installation
################################################################################

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing 'sudo' time stamp until '.osx' has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# XCode Command Line Tools

if ! xcode-select --print-path &> /dev/null; then

  # Prompt user to install the XCode Command Line Tools
  xcode-select --install &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Wait until the XCode Command Line Tools are installed
  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done

  print_result $? 'Install XCode Command Line Tools'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Point the `xcode-select` developer directory to
  # the appropriate directory from within `Xcode.app`
  # https://github.com/alrra/dotfiles/issues/13

  sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
  print_result $? 'Make "xcode-select" developer directory point to Xcode'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Prompt user to agree to the terms of the Xcode license
  # https://github.com/alrra/dotfiles/issues/10

  sudo xcodebuild -license
  print_result $? 'Agree with the XCode Command Line Tools licence'

fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
	echo "Installing Homebrew..."
  	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! brew info cask &>/dev/null; then
  echo 'Installing Cask'
  brew tap caskroom/cask
fi

brew install zsh

# setup zsh
BREWED_ZSH="/usr/local/bin/zsh"
if ! grep -Fxq "$BREWED_ZSH" /etc/shells; then
  echo "$BREWED_ZSH" | sudo tee -a /etc/shells
  echo "Changing shell to ZSH."
  chsh -s "$BREWED_ZSH"
fi
unset BREWED_ZSH

# oh-my-zsh
if [ ! -d "$HOME"/.oh-my-zsh ]; then
  echo "Installing oh-my-zsh."
  git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME"/.oh-my-zsh
fi


echo "Symlinking all files to home directory."
# Run symlinking
source install.sh
