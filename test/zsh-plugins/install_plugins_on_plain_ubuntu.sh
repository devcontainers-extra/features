#!/bin/bash

set -e

source dev-container-features-test-lib

# Test ZSH npm plugin
check "npm plugin active" zsh -i -c "echo \$plugins" | grep "npm"
check "npm aliases available" zsh -i -c "which npmR" | grep "npm run"

# Test Oh-My-ZSH dogesay plugin
check "dogesay plugin active" zsh -i -c "echo \$plugins" | grep "dogesay"
check "dogesay custom plugin exists" zsh -i -c "ls ~/.oh-my-zsh/custom/plugins/dogesay"

reportResults
