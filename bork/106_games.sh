#!/usr/bin/env bork satisfy
# BORK_CONTEXT: HOME


ok cask minecraft
# TODO: Optifine?
# JDK, e.g. for Optifine
ok brew openjdk
# Probably not needed...
# Install by hand from https://www.java.com/en/

# Minecraft Screenshots
ok symlink $HOME/Library/Application\ Support/minecraft/screenshots $HOME/Documents/Pictures/minecraft


ok cask steam
ok mas 1246969117 Steam Link
ok cask openra

