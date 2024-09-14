#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "porter --version" porter --version

# Exec mixin should be installed by default
check "exec mixin installed" "$PORTER_HOME"/mixins/exec/exec version

check "List all mixins" "$PORTER_HOME"/porter mixins list

reportResults
