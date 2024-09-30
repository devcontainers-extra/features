
# Homebrew Package (homebrew-package)

Installs a Homebrew package.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/homebrew-package:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| package | Select the Homebrew package to install. | string | - |
| version | Select the version of the Homebrew package to install. | string | latest |
| installation_flags | Additional installation flags. These would be used as extra arguments to the brew command (`brew install <installation_flags> <package>@<version>`) | string | - |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
