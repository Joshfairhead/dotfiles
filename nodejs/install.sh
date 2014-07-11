#!/bin/bash

if [[ "$(uname -s)" == "Darwin" ]]; then
  # TODO
  pprint error "Unimplemented for Mac"
  exit 1
elif [[ "$(uname -s)" == "Linux" ]]; then
  sudo apt-get install python-software-properties > /tmp/apt-get-python-software-properties.dot.log 2>&1
  sudo add-apt-repository ppa:chris-lea/node.js > /tmp/add-apt-repository-nodejs.dot.log 2>&1
  sudo apt-get update > /tmp/apt-get-update.dot.log 2>&1
  sudo apt-get install nodejs > /tmp/apt-get-nodejs.dot.log 2>&1
  pprint ok "NodeJS freshly installed"
else
  pprint error "Unrecognized OS"
  exit 0
fi

npm install -g jshint
if [[ $? == 0 ]]; then
  pprint error "Failed to install NodeJS global packages"
  exit 1
fi

pprint ok "NodeJS is ready to rock"
exit 0
