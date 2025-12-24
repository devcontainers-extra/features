#!/usr/bin/env bash

set -e

# Copied from /etc/bash.bashrc which is not sourced in non-interactive shell
export SDKMAN_DIR=/usr/local/sdkman
source ${SDKMAN_DIR}/bin/sdkman-init.sh

source dev-container-features-test-lib

check "sdk current | grep "scalacli"" sdk current | grep "scalacli"

reportResults
