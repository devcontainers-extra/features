#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "buku --version" buku --version

reportResults
