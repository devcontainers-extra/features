#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "sops --version" sops --version

reportResults
