#!/bin/bash

set -e

source dev-container-features-test-lib

check "vscode-cli" code --version

reportResults
