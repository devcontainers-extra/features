#!/bin/bash

set -e

source dev-container-features-test-lib

check "vscode-server" code-server --version

reportResults
