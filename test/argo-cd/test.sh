#!/bin/bash

set -e

source dev-container-features-test-lib

check "argocd cli existance" which argocd
# version exists with '1' when no server specified
check "argocd cli executable" argocd --help

reportResults
