#!/bin/bash

# to get the right position and size, move stuff manually, then run...
# osascript -e 'tell application "System Events"' -e 'get size of first window of application process "java"' -e 'end tell'
# osascript -e 'tell application "System Events"' -e 'get position of first window of application process "java"' -e 'end tell'

function place_window() {
	process=$1
	posX=$2
	posY=$3
	sizeX=$4
	sizeY=$5

	osascript\
		-e 'tell application "System Events"'\
		-e "set position of first window of application process \"$process\" to {$posX, $posY}"\
		-e 'end tell'
	osascript\
		-e 'tell application "System Events"'\
		-e "set size of first window of application process \"$process\" to {$sizeX, $sizeY}"\
		-e 'end tell'
}

echo ====================
echo Twitch Chat
echo ====================

# Check if it's already running...
if ps -ef | grep -v grep | grep ChatGameFontificator ; then
	echo ChatGameFontificator already running
else
	# And start it if it isn't
	echo Starting ChatGameFontificator
	cd ~/Twitch
	java -jar ~/Twitch/ChatGameFontificator.jar &
	cd -
	echo "Connect to chat, then close config window, and press enter"
	read
	# TODO: automatically close the config window, after connecting to chat?
fi
# Should start in the right place already, but just in case...
# TODO: what happens if there are more than one java processes?
place_window java 1520 87 400 522


echo
echo ====================
echo Stickies
echo ====================

# Check if it's already running...
if ps -ef | grep -v grep | grep Stickies ; then
	echo Stickies already running
else
	# And start it if it isn't
	echo Starting Stickies
	open -a stickies
	sleep 5
fi

place_window Stickies 1528 786 392 294


# TODO: Set Twitch title, GoLive, Tags, Category
