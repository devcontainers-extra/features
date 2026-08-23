# X11/Wayland Migration (x11-wayland)

Migration-assistance feature for Docker to Podman Dev Containers.

## What it does

- Configures `DISPLAY` and `XDG_RUNTIME_DIR` environment variables
- Documents required host runtime configuration
- Provides migration guidance from Docker to Podman

## What it does NOT do

- Does NOT install X11 or Wayland packages (host-provided)
- Does NOT start an X server or Wayland compositor
- Does NOT mount host sockets automatically
- Does NOT recursively modify `/tmp` permissions

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| `setupDisplayVars` | Configure DISPLAY and XDG_RUNTIME_DIR environment variables | boolean | `true` |
| `documentRuntimeDeps` | Output diagnostics documenting required host runtime configuration | boolean | `true` |

## Required `devcontainer.json` Configuration

### WSLg / Windows Example

```json
{
  "features": {
    "ghcr.io/devcontainers-extra/features/x11-wayland:1": {}
  },
  "mounts": [
    "--volume=/run/podman/podman.sock:/run/podman/podman.sock",
    "--volume=/mnt/wslg/.X11-unix:/tmp/.X11-unix:rw",
    "--volume=/mnt/wslg/runtime-dir:/mnt/wslg/runtime-dir:rw"
  ],
  "remoteEnv": {
    "DISPLAY": ":0",
    "WAYLAND_DISPLAY": "wayland-0",
    "XDG_RUNTIME_DIR": "/mnt/wslg/runtime-dir"
  }
}
```

### Linux Example

```json
{
  "features": {
    "ghcr.io/devcontainers-extra/features/x11-wayland:1": {}
  },
  "mounts": [
    "source=/tmp/.X11-unix,target=/tmp/.X11-unix,type=bind"
  ],
  "remoteEnv": {
    "DISPLAY": "${localEnv:DISPLAY}",
    "XDG_RUNTIME_DIR": "${localEnv:XDG_RUNTIME_DIR}"
  }
}
```

## Diagnostics

The feature outputs warnings when required host configuration is missing:

```
WARNING: X11 socket directory /tmp/.X11-unix not found.
         Mount via devcontainer.json at container start.
         Documentation: https://github.dev/devcontainers-extra/features/blob/main/src/x11-wayland/README.md
```

## Supported Usage

- Docker-to-Podman migration assistance
- X11/Wayland configuration documentation
- Environment variable setup for GUI applications
- VS Code setting: `dev.containers.mountWaylandSocket: false` if Wayland auto-mounting causes issues

## Notes

- This feature does NOT install any packages
- All X11/Wayland runtime dependencies must be provided by the host
- Combine with `podman-outside-of-podman` feature for full Docker-to-Podman migration