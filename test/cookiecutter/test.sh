#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "cookiecutter --version" cookiecutter --version

reportResults
