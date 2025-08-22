#!/usr/bin/env bork satisfy
# BORK_CONTEXT: EVERYWHERE


#
# Accessibility
#

# Three finger drag
ok defaults com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag bool true

# TODO: function keys as F keys






#
# Security
#

# ask for password immediately after starting screensaver or sleep
ok defaults com.apple.screensaver askForPassword bool true
ok defaults com.apple.screensaver askForPasswordDelay bool false




#
# Dock
#

bork_any_updated=0

# set icon size
ok defaults com.apple.dock autohide bool true

if any_updated; then
  killall Dock
fi



#
# Finder
#

ok defaults com.apple.finder FXRemoveOldTrashItems bool true


#
# Keyboard
#
# Disable dictation shortcut
if satisfying; then
	defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 164 "<dict><key>enabled</key><false/></dict>"
	# https://apple.stackexchange.com/a/414836
	/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
fi
