#!/bin/bash

set -e

source dev-container-features-test-lib

check "node is installed" node --version
check "npm is installed" npm --version

markdown_file=$(mktemp --suffix=.md)
trap 'rm -f "$markdown_file"' EXIT
printf '# Test\n' > "$markdown_file"
check "markdownlint-cli2 lints Markdown" markdownlint-cli2 "$markdown_file"

reportResults
