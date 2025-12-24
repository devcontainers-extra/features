#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ory version" ory version

reportResults
