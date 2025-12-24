#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "nnn -V" nnn -V

reportResults
