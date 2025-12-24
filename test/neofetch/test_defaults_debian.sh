#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "neofetch --print_config" neofetch --print_config

reportResults
