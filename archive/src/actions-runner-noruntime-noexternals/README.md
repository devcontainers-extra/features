
# GitHub Actions Runner (No Runtime, No Externals) (actions-runner-noruntime-noexternals)

The runner is the application that runs a job from a GitHub Actions workflow. It is used by GitHub Actions in the hosted virtual environments, or you can self-host the runner in your own environment.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/actions-runner-noruntime-noexternals:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | latest |
| dotnetVersion | Select the dotnet version to install. | string | latest |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
