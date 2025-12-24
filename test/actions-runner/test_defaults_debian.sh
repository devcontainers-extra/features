#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "$HOME/actions-runner/run.sh --version" $HOME/actions-runner/run.sh --version

reportResults
