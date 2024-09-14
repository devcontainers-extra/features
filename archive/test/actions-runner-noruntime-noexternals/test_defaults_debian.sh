#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "$HOME/actions-runner/run.sh --version" $HOME/actions-runner/run.sh --version

reportResults
