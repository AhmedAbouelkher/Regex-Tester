#!/bin/sh

create-dmg \
  --volname "Regex Tester" \
  --volicon "../assets/logo.icns" \
  --window-pos 200 120 \
  --window-size 800 400 \
  --icon-size 130 \
  --text-size 14 \
  --icon "Regex Tester.app" 260 250 \
  --hide-extension "Regex Tester.app" \
  --app-drop-link 540 250 \
  --hdiutil-quiet \
  "../executables/Regex Tester.dmg" \
  "../build/macos/Build/Products/Release/Regex Tester.app"