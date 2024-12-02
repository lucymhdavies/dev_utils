#!/usr/bin/env bork satisfy
# BORK_CONTEXT: EVERYWHERE

#
# Casks
#

ok cask google-chrome

ok cask slack

ok cask maccy
# TODO: Maccy Config

ok cask zoom

ok cask bartender
# TODO: Bartender config?

ok cask istat-menus
# TODO: istatmenu license
# TODO: istatmenu config

ok cask visual-studio-code
# TODO: All the config and stuff!

ok cask google-drive
ok cask dropbox

#
# Mac App Store
#

# Magnet, and override macOS Sequoia settings
ok mas 441258766 Magnet
ok defaults com.apple.WindowManager EnableTiledWindowMargins bool false
ok defaults com.apple.WindowManager EnableTilingByEdgeDrag bool false
ok defaults com.apple.WindowManager EnableTilingOptionAccelerator bool false
ok defaults com.apple.WindowManager EnableTopTilingByEdgeDrag bool false


# TODO: System Preferences > Accessibility > Magnet.app
# TODO: Config: ~/Library/Preferences/com.crowdcafe.windowmagnet.plist
