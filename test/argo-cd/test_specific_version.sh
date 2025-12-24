#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "argocd version is equal to 2.14.14" sh -c "argocd version | grep '2.14.14'"

reportResults
