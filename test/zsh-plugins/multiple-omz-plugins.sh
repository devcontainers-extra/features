#!/bin/bash

set -e

source dev-container-features-test-lib

# Test Oh-My-ZSH F-Sy-H plugin
check "F-Sy-H custom plugin exists" zsh -i -c "ls ~/.oh-my-zsh/custom/plugins/F-Sy-H"
# Test Oh-My-ZSH zsh-autocomplete plugin
check "zsh-autocomplete custom plugin exists" zsh -i -c "ls ~/.oh-my-zsh/custom/plugins/zsh-autocomplete"

reportResults
