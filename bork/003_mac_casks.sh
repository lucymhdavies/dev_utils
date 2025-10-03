#!/usr/bin/env bork satisfy
# BORK_CONTEXT: EVERYWHERE
DEV_UTILS_DIR=$HOME/git_src/dev_utils

#
# Casks
#

ok cask google-chrome

ok cask slack

# Currently disabling, given macOS has its own clipboard history now
#ok cask maccy
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

# DisplayLink Drivers
# https://www.synaptics.com/products/displaylink-graphics/downloads/macos
ok cask displaylink

#
# Mac App Store
#

# Magnet, and override macOS Sequoia settings
ok mas 441258766 Magnet
ok defaults com.apple.WindowManager EnableTiledWindowMargins bool false
ok defaults com.apple.WindowManager EnableTilingByEdgeDrag bool false
ok defaults com.apple.WindowManager EnableTilingOptionAccelerator bool false
ok defaults com.apple.WindowManager EnableTopTilingByEdgeDrag bool false

# Rather than trying to check each parameter one at a time... here's just a known-good config file
ok check "diff -q ${DEV_UTILS_DIR}/defaults/com.crowdcafe.windowmagnet <(defaults export com.crowdcafe.windowmagnet -)"
# TODO: there is an issue related to what I think is Magnet syncing config to iCloud...
	# $ diff ${DEV_UTILS_DIR}/defaults/com.crowdcafe.windowmagnet <(defaults export com.crowdcafe.windowmagnet -)
	#331a332,335
	#>       <key>lastPreferenceSync</key>
	#>       <data>
	#>       NzYxMzQ3Nzg4LjY3NTYxMw==
	#>       </data>
# so we need to ignore that somehow...
# (but even then... iCloud syncing is disabled, because it doesn't work on the MacBook)

if check_failed; then
	echo "Magnet defaults do not match dev_utils. we're not attempting to remediate this ourselves right now, so... do it yourself?"
	#diff ${DEV_UTILS_DIR}/defaults/com.crowdcafe.windowmagnet <(defaults export com.crowdcafe.windowmagnet -)

	#if satisfying; then
		#echo "Setting Magnet defaults"
		#defaults import com.crowdcafe.windowmagnet ${DEV_UTILS_DIR}/defaults/com.crowdcafe.windowmagnet
	#fi
fi


# TODO: System Preferences > Accessibility > Magnet.app
# TODO: Config: ~/Library/Preferences/com.crowdcafe.windowmagnet.plist
