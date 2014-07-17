#!/usr/bin/env bash

# List terminal background and foreground color codes.
# Works with terminals which can display 256 colors such as gnome-terminal.

# \c prevents echo from inserting new line at the end of the string
(echo -e "Reset\t\c"
echo "\e[0m"
for fgbg in 38 48 ; do
  if [ $fgbg -eq 38 ]; then
    echo "Foreground Colors"
  else
    echo "Background Colors"
  fi

  for color in {0..256} ; do
    echo -e "\e[${fgbg};5;${color}m ${color}\t\e[0m\t\c"
    echo "\e[${fgbg};5;${color}m"
  done
done
) | less -R
exit $PIPESTATUS
