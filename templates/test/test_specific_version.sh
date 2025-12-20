#!/usr/bin/env bash

set -e

source dev-container-features-test-lib
{{- $binaryNames := splitList "," .BinaryNames}}
{{- $versionCommands := splitList "," .BinaryVersionCommands}}
{{- $nonLatestVersions := splitList "," .BinaryNonLatestVersions}}
{{- range $index, $binary := $binaryNames}}
{{- $versionCmd := "--version"}}
{{- if gt (len $versionCommands) 1}}
{{- $versionCmd = index $versionCommands $index}}
{{- else if eq (len $versionCommands) 1}}
{{- $versionCmd = index $versionCommands 0}}
{{- end}}
{{- $nonLatestVersion := index $nonLatestVersions $index}}

check "{{$binary}} version is equal to {{$nonLatestVersion}}" sh -c "{{$binary}} {{$versionCmd}} | grep '{{$nonLatestVersion}}'"
{{- end}}

reportResults
