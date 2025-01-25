#!/usr/bin/env bork satisfy
# BORK_CONTEXT: HOME


# TODO: Setup / folders / etc
# sudo kmutil load -p /Library/Filesystems/kbfuse.fs/Contents/Extensions/11/kbfuse.kext

ok cask adobe-creative-cloud

ok cask authy

ok cask cool-retro-term


# Webcam Stuff
ok cask logitech-camera-settings
ok defaults com.logitech.vc.CameraSettings.Persistent "Anti-Flicker" integer 50
ok defaults com.logitech.vc.CameraSettings.Persistent AutoFocus integer 1
ok defaults com.logitech.vc.CameraSettings.Persistent AutoWhiteBalance integer 1



ok cask backblaze
# TODO: Launch /opt/homebrew/Caskroom/backblaze/7.0.2.490/bzd
# TODO: Set up license and config manually


ok mas 682658836 GarageBand
ok mas 1278508951 Trello
ok mas 411643860 DaisyDisk
ok mas 1480068668 Messenger
ok mas 1387764101 Minimalist
ok cask whatsapp



#
# Other Config
#
# TODO: Enable Home Sharing
# TODO: Time Machine?
# TODO: User Avatar
# TODO: Dock
# TODO: Finder Favorites
