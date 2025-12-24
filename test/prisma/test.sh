#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "prisma --help" prisma --help

reportResults
