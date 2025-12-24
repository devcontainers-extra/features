#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "gdbgui --version" gdbgui --version

reportResults
