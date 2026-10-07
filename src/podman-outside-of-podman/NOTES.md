# Podman Outside-of-Podman Notes

## No Nested Podman Engine

This feature does NOT start a nested Podman engine inside the Dev Container.

```
Dev Container
    │
    └── Podman CLI --remote
              │
              ▼
       External Podman
              │
              ▼
         Containers
```

Do not attempt to run `podman system service` or `podman machine` inside the Dev Container.

## Installation Methods

### GitHub Releases (Default for `version=latest`)
When `version=latest` (the default), the feature attempts to install the latest Podman release directly from GitHub releases. This ensures you get Podman 6 (or the latest stable version) regardless of your distribution's package repository.

### Distribution Packages (Fallback)
If GitHub releases installation fails, the feature falls back to installing from your distribution's package repositories. Note that these may have older versions of Podman.

### Specific Version
You can specify an exact version like `version=5.0.0` to install from distribution repositories.

## Remote API Configuration

The feature configures the Podman CLI for remote operation. The actual Podman endpoint must be provided by the Dev Container runtime configuration.

Possible endpoint sources:
- `PODMAN_HOST` environment variable pointing to a Unix socket (`unix:///path/to/socket`)
- Mounted Podman API socket from the host
- `containers.conf` with configured remote connections

## Podman CLI vs Podman Engine

Inside the Dev Container:
```
Podman CLI → REST/API → External Podman service → Podman engine → Containers
```

The feature installs the Podman CLI. The host provides the engine.

Do not accidentally configure the container to use local Podman storage when the feature is intended to use remote Podman.