#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "express --version" express --version

reportResults
