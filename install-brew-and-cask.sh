#!/usr/bin/env bash

################################################################################
# install-brew-and-cask
#
# This script installs brew and brew cask, when not already present.
#
################################################################################


install_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n[INSTALL-BREW] $fmt\n" "$@"
}


/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if ! command -v brew >/dev/null; then
  install_echo "Installing Homebrew ..."
    curl -fsSL \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

if ! brew info brew-cask &>/dev/null; then
  install_echo "Installing Homebrew Cask ..."
  brew tap caskroom/cask
fi
