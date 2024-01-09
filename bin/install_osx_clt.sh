#! /usr/bin/env bash

# This script has been adapted from the CLT installation
# sections of the Homebrew install script:
# https://raw.githubusercontent.com/Homebrew/install/master/install.sh

set -u

if ! [[ -e "/Library/Developer/CommandLineTools/usr/bin/git" ]]; then
  printf "OSX Commandline Tools not found.\n"
  clt_placeholder="/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress"
  touch "${clt_placeholder}"

  clt_label_command="/usr/sbin/softwareupdate -l |
                      grep -B 1 -E 'Command Line Tools' |
                      awk -F'*' '/^ *\\*/ {print \$2}' |
                      sed -e 's/^ *Label: //' -e 's/^ *//' |
                      sort -V |
                      tail -n1 |
                      tr -d '\n'"
  
  printf -v clt_label "$(/bin/bash -c "${clt_label_command}")"
  
  if [[ -n "${clt_label}" ]]; then
     printf 'Installing "%s"....\n' "${clt_label}"
     /usr/sbin/softwareupdate -i "${clt_label}"
     /usr/bin/xcode-select --switch /Library/Developer/CommandLineTools
     /bin/rm "${clt_placeholder}"
  fi
else
  printf "OSX Commandline Tools already installed.\n"
fi

