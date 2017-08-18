#!/usr/bin/env bash

################################################################################
# bootstrap
#
# This script is intended to bootstrap my dotfiles.
# It starts from a new Mac OS X and does the necessary to be able to run my
# dotfiles.
#
# It will not run the dotfiles installer itself. That is your next step.
#
# How to use it?
# Manually download the file from github, chmod 744 so you can run it, and
# run it in the terminal.
# When asked to install the developer tools, choose install.
# Then reboot the computer and run this script again.
#
################################################################################


# Thank you, thoughtbot!
bootstrap_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n[BOOTSTRAP] $fmt\n" "$@"
}


################################################################################
# Variable declarations
################################################################################

osname=$(uname)
export COMMANDLINE_TOOLS="/Library/Developer/CommandLineTools"
export DOTFILES_BACKUP=$HOME/dotfiles_backup
export DICTIONARY_DIR=$HOME/Library/Spelling

export DOTFILES_REPO_URL="https://github.com/fmechant/dotfiles.git"
export DOTFILES_BRANCH="master"
export DOTFILES_DIR=$HOME/dotfiles


################################################################################
# Make sure we're on a Mac before continuing
################################################################################

if [ "$osname" == "Linux" ]; then
  bootstrap_echo "Oops, looks like you're on a Linux machine. Please have a look at
  my Linux Bootstrap script: https://github.com/joshukraine/linux-bootstrap"
  exit 1
elif [ "$osname" != "Darwin" ]; then
  bootstrap_echo "Oops, it looks like you're using a non-UNIX system. This script
only supports Mac. Exiting..."
  exit 1
fi


################################################################################
# Make sure we have an up-to-date Mac system
################################################################################

update_list=$(softwareupdate --list 2>&1)

if [[ $update_list != *"No new software available"* ]]; then
  bootstrap_echo "Your system has updates available. Updating the system. Please
provide your password when asked. Reboot when needed and restart the
bootstrap script."
  sudo softwareupdate -ia --verbose
  exit 1
else
  bootstrap_echo "System is up-to-date."
fi

################################################################################
# Check for presence of command line tools
################################################################################

if [ ! -d "$COMMANDLINE_TOOLS" ]; then
  bootstrap_echo "Apple's command line developer tools must be installed. It
contains git that we need to clone the dotfiles. Please follow the prompts and
select 'install'. Once the command line tools have been installed, run this
script again to complete the bootstrap."
  xcode-select --install
  exit 1
else
  bootstrap_echo "Found the Apple's command line developer tools."
fi


################################################################################
# Setup dotfiles
################################################################################

bootstrap_echo "Bootstrapping the dotfiles..."

if [[ -d $DOTFILES_DIR ]]; then
  bootstrap_echo "Backing up old dotfiles to $DOTFILES_BACKUP..."
  rm -rf "$DOTFILES_BACKUP"
  cp -R "$DOTFILES_DIR" "$DOTFILES_BACKUP"
  rm -rf "$DOTFILES_DIR"
fi

bootstrap_echo "Cloning dotfiles repo to ${DOTFILES_DIR} ..."

git clone "$DOTFILES_REPO_URL" -b "$DOTFILES_BRANCH" "$DOTFILES_DIR"


################################################################################
# Done
################################################################################

bootstrap_echo "Done! You can now install your dotfiles."
