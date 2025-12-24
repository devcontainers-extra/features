#!/bin/bash

set -e

source dev-container-features-test-lib

check "Angular CLI is installed (via bun-package)" bunx ng version

reportResults
