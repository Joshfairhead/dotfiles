#!/usr/bin/env bash
source $DOT/functions/try

try pinstall brew rbenv
try pinstall brew ruby-build
exit $TRY_CODE
