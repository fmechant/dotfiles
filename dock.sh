#!/usr/bin/env bash

# Sets up the dock like I want it

dockutil --no-restart --remove all
dockutil --no-restart --add "/System/Library/CoreServices/Finder.ap"
dockutil --no-restart --add "/Applications/Launchpad.app"
dockutil --no-restart --add "/Applications/Airmail 3.app"
dockutil --no-restart --add "/Applications/Fantastical 2.app"
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "/Applications/Firefox.app"
dockutil --no-restart --add "/Applications/HipChat.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Atom.app"

dockutil --no-restart --add '~/Downloads' --view fan --display stack --sort dateadded --section others
killall Dock
