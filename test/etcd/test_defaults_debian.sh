#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "etcd --version && etcdctl version" etcd --version && etcdctl version

reportResults
