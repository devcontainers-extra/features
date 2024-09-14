#!/bin/bash -i

set -e

source dev-container-features-test-lib

echo "User: $(id)"
ls -al "$PORTER_HOME"

check "porter --version" porter --version

# Exec mixin should be installed by default
check "exec mixin installed" "$PORTER_HOME"/mixins/exec/exec version
check "terraform mixin installed" "$PORTER_HOME"/mixins/terraform/terraform version
check "az mixin installed" "$PORTER_HOME"/mixins/az/az version
check "docker mixin installed" "$PORTER_HOME"/mixins/docker/docker version
check "docker-compose mixin installed" "$PORTER_HOME"/mixins/docker-compose/docker-compose version
check "gcloud mixin installed" "$PORTER_HOME"/mixins/gcloud/gcloud version
check "helm mixin installed" "$PORTER_HOME"/mixins/helm/helm version
check "arm mixin installed" "$PORTER_HOME"/mixins/arm/arm version
check "azure plugin installed" "$PORTER_HOME"/plugins/azure/azure version
check "kubernetes plugin installed" "$PORTER_HOME"/plugins/kubernetes/kubernetes version

reportResults
