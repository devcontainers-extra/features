#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "eslint version is equal to 9.20.1" bash -c "eslint --version | grep 'v9.20.1'"
check "nodemon is installed" nodemon --version
check "prettier version is equal to 3.5.2" bash -c "prettier --version | grep '3.5.2'"
check "@angular/cli version is equal to 19.2.1" bash -c "ng --version | grep '19.2.1'"
check "@biomejs/biome is installed" biome --version

reportResults
