
# Porter (via porter.sh) (porter)

Porter enables you to package your application artifact, client tools, configuration and deployment logic together as an installer that you can distribute, and install with a single command.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/porter:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. Empty string installs the latest version. | string | latest |
| terraformMixinVersion | [Optional] Select the terraform mixin version to install. | string |  |
| azMixinVersion | [Optional] Select the az mixin version to install. | string |  |
| awsMixinVersion | [Optional] Select the aws mixin version to install. | string |  |
| dockerMixinVersion | [Optional] Select the docker mixin version to install. | string | |
| dockerComposeMixinVersion | [Optional] Select the docker-compose mixin version to install. | string | |
| gcloudMixinVersion | [Optional] Select the gcloud mixin version to install. | string | |
| helmMixinVersion | [Optional] Select the helm mixin version to install. | string | |
| armMixinVersion | [Optional] Select the arm mixin version to install. | string | |
| azurePluginVersion | [Optional] Select the azure plugin version to install. | string | |
| kubernetesPluginVersion | [Optional] Select the kubernetes plugin version to install. | string |  |


