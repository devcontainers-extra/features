#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "wget --version" wget --version

reportResults
