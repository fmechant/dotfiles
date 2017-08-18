#!/usr/bin/env bash

# Install command-line tools using Homebrew.

brew update
brew upgrade


# TODO Look into core utilies
# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# brew install coreutils
# Install some other useful utilities like `sponge`.
# brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
# brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
# brew install gnu-sed --with-default-names


# brew install z

brew install bash
brew install bash-completion2
# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;


brew install brew-cask-completion


# Install more recent versions of some macOS tools.
#brew install vim --with-override-system-vi
#brew install grep
#brew install openssh
#brew install screen


# Install util for managing the dock items
brew install dockutil


# Install other useful binaries.
brew install git
brew install rsync
brew install awscli
brew install elm
brew install elm-format
brew install node


# Remove outdated versions from the cellar.
brew cleanup
