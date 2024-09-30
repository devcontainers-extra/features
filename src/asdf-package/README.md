
# asdf package (asdf-package)

Installs an asdf package.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/asdf-package:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| plugin | Select the asdf plugin to install. | string | - |
| version | Select the version of the asdf plugin to install. | string | latest |
| pluginRepo | Select the asdf plugin repo to install (can remain empty in order to use the plugin short-name index https://github.com/asdf-vm/asdf-plugins) | string | - |
| latestVersionPattern | this will be used as argument for 'asdf latest <plugin> <latestVersionPattern>' command. If none given the default asdf of '[0-9]' will be used. | string | - |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
