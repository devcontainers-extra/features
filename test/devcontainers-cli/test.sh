#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "devcontainer --version" devcontainer --version

reportResults
