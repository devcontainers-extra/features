
# Layrry (via SDKMAN) (layrry-sdkman)

Layrry - A Launcher and API for Modularized Java Applications. It allows to
assemble modularized applications based on Maven artifact coordinates of the
(modular) JARs to include. Layrry utilizes the Java Module System's notion of
module layers, allowing multiple versions of one module to be used within an
application at the same time, as well as dynamically adding and removing modules
at application runtime.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/layrry-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
