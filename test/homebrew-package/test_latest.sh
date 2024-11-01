#!/bin/bash

set -e

source dev-container-features-test-lib

check "type grpcurl" type grpcurl

reportResults
