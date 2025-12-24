#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "mkdocs is installed" mkdocs --version
check "mkdocs-material theme is available" sh -c "cd $(uv tool dir)/mkdocs && uv pip list | grep mkdocs-material"
check "mkdocs-minify-plugin is available" sh -c "cd $(uv tool dir)/mkdocs && uv pip list | grep mkdocs-minify-plugin"

reportResults
