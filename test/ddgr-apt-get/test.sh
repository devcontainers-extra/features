#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ddgr --version" ddgr --version

reportResults
