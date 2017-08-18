#!/usr/bin/env bash

# Install applications using Homebrew Cask.

brew update
brew upgrade


brew tap caskroom/fonts


brew cask install iterm2
brew cask install alfred  # Enable accessibility access manually
brew cask install atom
brew cask install java dbeaver-community
brew cask install flux
brew cask install font-cabin-sketch
brew cask install geektool
brew cask install gpgtools
brew cask install hammerspoon  # Enable accessibility access manually
brew cask install karabiner-elements
brew cask install firefox
brew cask install lastpass  # Run installer manually
brew cask install fantastical
brew cask install hipchat
brew cask install vlc
brew cask install android-file-transfer
brew cask install calibre
brew cask install blue-jeans-launcher  # Run installer manually


# brew cask install java sts


# Remove outdated versions from the cellar.
brew cleanup
