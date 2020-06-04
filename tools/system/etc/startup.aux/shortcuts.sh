#!/bin/bash
#
# shortcuts.sh -- update shortcuts based on different system
#

[ -z "$UNIX_USER" ] && UNIX_USER=ubuntu

CHROMIUM_EXEC=/usr/bin/chromium-browser
FIREFOX_EXEC=/usr/bin/firefox
CHROMIUM_ICON=/usr/share/pixmaps/chromium-browser.png
FIREFOX_ICON=/usr/share/icons/hicolor/48x48/apps/firefox.png

which chromium-browser
if [ $? -ne 0 ]; then
  which firefox
  if [ $? -eq 0 ]; then
    sed -i -e "s%Exec=$CHROMIUM_EXEC%Exec=$FIREFOX_EXEC%g" /home/$UNIX_USER/Desktop/*.desktop
    sed -i -e "s%Icon=$CHROMIUM_ICON%Icon=$FIREFOX_ICON%g" /home/$UNIX_USER/Desktop/*.desktop
  fi
fi
