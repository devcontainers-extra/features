# Podman Outside-of-Podman (podman-outside-of-podman)

Installs and configures the Podman CLI for use with an externally managed Podman service.

## What it does

- Installs the Podman CLI inside the Dev Container
- Configures Podman for remote operation with an external Podman service
- Supports `version=latest` (default) and explicit version selection
- Configures the non-root user for Podman usage

## What it does NOT do

- Does NOT run a nested Podman engine
- Does NOT start `podman system service`
- Does NOT run `podman machine`
- Does NOT create a second Podman VM
- Does NOT own host Podman storage

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| `version` | Select the version of Podman to install. Use `latest` for Podman 6 from GitHub releases. | string | `latest` |
| `remote` | Configure Podman for remote operation with an external Podman service | boolean | `true` |

## Installation Methods

### GitHub Releases (Default for `version=latest`)
When `version=latest` (the default), the feature attempts to install the latest Podman release directly from GitHub releases. This ensures you get Podman 6 (or the latest stable version) regardless of your distribution's package repository.

### Distribution Packages (Fallback)
If GitHub releases installation fails, the feature falls back to installing from your distribution's package repositories. Note that these may have older versions of Podman.

### Specific Version
You can specify an exact version like `version=5.0.0` to install from distribution repositories.

## Remote Usage

After installation, the Podman CLI can be used to communicate with an external Podman service:

```bash
podman --remote --help
podman --remote info
podman --remote ps
podman --remote images
```

The remote endpoint/socket must be provided by the consuming Dev Container runtime configuration, typically via:
- `PODMAN_HOST` environment variable
- Mounted Podman API socket
- `containers.conf` configuration

## VS Code Settings

The following VS Code setting can be adjusted in `settings.json`:

```json
{
    "dev.containers.mountWaylandSocket": false
}
```

Set this to `false` if automatic Wayland socket mounting causes conflicts with your Podman remote configuration.

## Supported Distributions

- Debian/Ubuntu/Kali/Linux Mint (apt-get)
- Fedora/RHEL/CentOS/Rocky/AlmaLinux (dnf)
- Arch/Manjaro (pacman)
- openSUSE/SUSE (zypper)

GitHub releases installation (default for `version=latest`) supports:
- x86_64/amd64
- aarch64/arm64
- armv7l/armhf

## Example `devcontainer.json`

```json
{
    "features": {
        "ghcr.io/devcontainers-extra/features/podman-outside-of-podman:1": {
            "version": "latest",
            "remote": true
        }
    },
    "environmentVariables": {
        "PODMAN_HOST": "unix://${HostPODMAN_SOCKET_PATH}"
    },
    "mounts": [
        "source=${HostPODMAN_SOCKET_PATH},target=/run/podman/podman.sock,type=bind"
    ]
}
```