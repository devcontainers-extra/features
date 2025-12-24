#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "nmap --version" nmap --version

reportResults
