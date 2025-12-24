#!/bin/bash

set -e

source dev-container-features-test-lib

check "heroku existence" heroku version

reportResults
