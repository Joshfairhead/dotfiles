#!/usr/bin/env bash
# shellcheck source=../.dot/functions/try
source $DOT/.dot/functions/try

try pinstall brew ipython
try pinstall brew pipenv
try pinstall brew tox

exit $TRY_CODE
