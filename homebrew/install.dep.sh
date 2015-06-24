#!/bin/bash

repo='install/master/install'
[[ "$(uname -s)" == "Linux" ]] && repo='linuxbrew/go/install'

# Check for Homebrew
if test ! $(which brew); then
  pprint info-go "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/${repo})" < /dev/null > /tmp/$DOT_TOPIC_LOGFILE_SUFFIX 2>&1
  [[ $? != 0 ]] && pprint info-error "Failed to install Homebrew" && exit 1
fi

pprint info-ok "Homebrew is ready to brew -- Choo, choo!"
exit 0
