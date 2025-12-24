#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "auditjs --version" auditjs --version

reportResults
