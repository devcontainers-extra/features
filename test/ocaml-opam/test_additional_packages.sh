#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "OUnit is installed" sh -c "opam list | grep ounit"
check "QCheck is installed" sh -c "opam list | grep qcheck"

reportResults
