#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "sleep 5 && docker ps && localstack --version && localstack start -d && sleep 10 && localstack status docker && localstack status services && localstack stop" sleep 5 && docker ps && localstack --version && localstack start -d && sleep 10 && localstack status docker && localstack status services && localstack stop

reportResults
