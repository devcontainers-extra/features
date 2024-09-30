
# Porter (via porter.sh) (porter)

Porter enables you to package your application artifact, client tools, configuration and deployment logic together as an installer that you can distribute, and install with a single command.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/porter:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. Empty string installs the latest version. | string | latest |
| terraformMixinVersion | Select the terraform mixin version to install. | string | - |
| azMixinVersion | Select the az mixin version to install. | string | - |
| awsMixinVersion | Select the aws mixin version to install. | string | - |
| dockerMixinVersion | Select the docker mixin version to install. | string | - |
| dockerComposeMixinVersion | Select the docker-compose mixin version to install. | string | - |
| gcloudMixinVersion | Select the gcloud mixin version to install. | string | - |
| helmMixinVersion | Select the helm mixin version to install. | string | - |
| armMixinVersion | Select the arm mixin version to install. | string | - |
| azurePluginVersion | Select the azure plugin version to install. | string | - |
| kubernetesPluginVersion | Select the kubernetes plugin version to install. | string | - |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
