# X11/Wayland Migration Notes

## No Package Installation

This feature does NOT install X11 or Wayland packages. X11 and Wayland runtime dependencies are host-provided resources.

## /tmp Permission Rule

Do not recursively set all files under /tmp to 1777.

Valid configuration:
```
/tmp                  1777
/tmp/.X11-unix        1777
/tmp/application      0755
/tmp/private-file     0600
```

Not appropriate:
```
chmod -R 1777 /tmp
```

This would incorrectly weaken permissions on arbitrary temporary files.

## X11/Wayland Architecture

Host provides the display infrastructure:
- X11 socket at `/tmp/.X11-unix`
- Wayland socket at `$XDG_RUNTIME_DIR/wayland-0`
- These are mounted via `devcontainer.json`

## Docker to Podman Migration

1. Docker uses `docker` CLI
2. Podman uses `podman --remote` for external Podman service
3. Both require X11/Wayland socket mounts from the host
4. This feature assists with X11/Wayland configuration
5. The `podman-outside-of-podman` feature handles Podman CLI setup
6. Never use `chmod -R 1777 /tmp`