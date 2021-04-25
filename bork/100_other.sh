#!/usr/bin/env bork satisfy


# Important Cask Stuff
ok cask google-chrome
ok cask chrome-remote-desktop-host
ok cask maccy
# TODO: Maccy Config
ok cask discord
ok cask zoom
ok cask lastpass
# TODO: lastpass keyboard shortcuts
ok cask bartender
# TODO: Bartender config?
ok cask istat-menus
# TODO: istatmenu license
# TODO: istatmenu config
ok cask keybase
# TODO: Setup / folders / etc
# sudo kmutil load -p /Library/Filesystems/kbfuse.fs/Contents/Extensions/11/kbfuse.kext
ok cask slack
ok cask visual-studio-code
# TODO: All the config and stuff!

ok cask adobe-creative-cloud

ok cask authy
ok cask airserver

# https://github.com/hashicorp/vault/issues/10645
# ok brew vault
# TODO: At least check for its existence for now

ok brew terraform


# Webcam Stuff
ok brew-tap homebrew/cask-drivers
ok cask logitech-camera-settings
ok defaults com.logitech.vc.CameraSettings.Persistent "Anti-Flicker" integer 50
ok defaults com.logitech.vc.CameraSettings.Persistent AutoFocus integer 1
ok defaults com.logitech.vc.CameraSettings.Persistent AutoWhiteBalance integer 1



ok cask backblaze
# TODO: Launch /opt/homebrew/Caskroom/backblaze/7.0.2.490/bzd
# TODO: Set up license and config manually

# Important MAS Stuff
ok mas 441258766 Magnet
# TODO: System Preferences > Accessibility > Magnet.app
# TODO: Config: ~/Library/Preferences/com.crowdcafe.windowmagnet.plist

ok mas 1482454543 Twitter
ok mas 682658836 GarageBand
ok mas 1278508951 Trello
ok mas 411643860 DaisyDisk
ok mas 1480068668 Messenger
ok cask whatsapp



#
# Games
#

ok cask minecraft
ok cask steam
ok mas 1246969117 Steam Link
ok cask openra



#
# Other Config
#
# TODO: Enable Home Sharing
# TODO: Time Machine?
# TODO: User Avatar
# TODO: Dock
# TODO: Finder Favorites
