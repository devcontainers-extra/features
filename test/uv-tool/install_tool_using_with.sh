#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "mkdocs-material theme is available" sh -c "cd $(uv tool dir)/mkdocs && uv pip list | grep mkdocs-material"

reportResults
