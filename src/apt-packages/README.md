
# apt packages (for Debian/Ubuntu) (apt-packages)

Advanced package tool, or APT, is a free-software user interface that works with core libraries to handle the installation and removal of software on Debian and Debian-based Linux distributions.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/apt-packages:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| packages | Comma separated list of packages. | string | - |
| ppas | Comma separated list of required ppas (not recommended) | string | - |
| clean_ppas | If ppas used, remove them after usage in order to increase safety | boolean | true |
| preserve_apt_list | Preserving the existing apt list (the result of apt-get update) will decrease container layer size (but will require a re-update of the packages database on next install) | boolean | true |
| force_ppas_on_non_ubuntu | Installing ppas on a non-ubuntu distro (eg. debian) is discouraged | boolean | false |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
