#!/bin/bash

set -e

source dev-container-features-test-lib

check "heroku existance" heroku version
check "heroku CLI version is equal to 9.3.1" sh -c "heroku version | grep '9.3.1'"

reportResults
