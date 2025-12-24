#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "type lite-server" type lite-server

reportResults
