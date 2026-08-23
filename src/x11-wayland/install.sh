#!/usr/bin/env bash

set -e

SETUP_DISPLAY_VARS="${SETUP_DISPLAY_VARS:-true}"
DOCUMENT_RUNTIME_DEPS="${DOCUMENT_RUNTIME_DEPS:-true}"

detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$ID"
    elif type lsb_release >/dev/null 2>&1; then
        lsb_release -si 2>/dev/null || echo "unknown"
    else
        echo "unknown"
    fi
}

setup_display_vars() {
    if [ "$SETUP_DISPLAY_VARS" = "true" ]; then
        if [ -z "$DISPLAY" ] && [ -n "$WAYLAND_DISPLAY" ]; then
            export DISPLAY=":0"
        fi

        if [ -z "$XDG_RUNTIME_DIR" ]; then
            export XDG_RUNTIME_DIR=/run/user/$(id -u)
            mkdir -p "$XDG_RUNTIME_DIR"
            chmod 700 "$XDG_RUNTIME_DIR"
        fi

        echo "Display variables configured:"
        echo "  DISPLAY=$DISPLAY"
        echo "  XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR"
    fi
}

document_runtime_deps() {
    if [ "$DOCUMENT_RUNTIME_DEPS" = "true" ]; then
        echo ""
        echo "=== X11/Wayland Runtime Dependencies ==="
        echo ""
        echo "This feature does NOT install X11 or Wayland runtime dependencies."
        echo "These must be provided by the host Dev Container configuration."
        echo ""
        echo "Required host resources (in devcontainer.json):"
        echo ""
        echo "1. X11 Socket Mount:"
        echo "   source=/tmp/.X11-unix,target=/tmp/.X11-unix,type=bind"
        echo ""
        echo "2. DISPLAY Environment Variable:"
        echo "   DISPLAY=:0"
        echo ""
        echo "3. Wayland Socket/Environment (if using Wayland):"
        echo "   WAYLAND_DISPLAY=$WAYLAND_DISPLAY"
        echo "   XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR"
        echo "   Mount $XDG_RUNTIME_DIR/wayland-0 if available"
        echo ""
        echo "4. Host X11/Wayland Infrastructure:"
        echo "   Host X Server or Wayland compositor must be running"
        echo ""
        echo "=== Podman Remote Configuration ==="
        echo ""
        echo "For Podman remote usage, ensure:"
        echo "  - PODMAN_HOST is set to the Podman endpoint"
        echo "  - Or the Podman API socket is mounted into the container"
        echo "  - Run: podman --remote info to verify connectivity"
        echo ""
        echo "=== Migration Notes ==="
        echo ""
        echo "When migrating from Docker to Podman:"
        echo "  - Docker uses 'docker' CLI, Podman uses 'podman --remote'"
        echo "  - GUI applications require X11/Wayland socket mounts"
        echo "  - Never use 'chmod -R 1777 /tmp'"
    fi
}

check_configuration() {
    local status="success"

    if [ ! -d "/tmp/.X11-unix" ]; then
        echo "WARNING: X11 socket directory /tmp/.X11-unix not found."
        echo "         Mount via devcontainer.json at container start."
        echo "         Documentation: https://github.dev/devcontainers-extra/features/blob/main/src/x11-wayland/README.md#required-devcontainerjson-configuration"
        status="warning"
    fi

    if [ -z "$XDG_RUNTIME_DIR" ]; then
        echo "WARNING: XDG_RUNTIME_DIR not set."
        echo "         Set via devcontainer.json remoteEnv."
        echo "         Documentation: https://github.dev/devcontainers-extra/features/blob/main/src/x11-wayland/README.md#required-devcontainerjson-configuration"
        status="warning"
    fi

    if [ -z "$WAYLAND_DISPLAY" ]; then
        echo "INFO: WAYLAND_DISPLAY not set (optional for Wayland support)."
        echo "      Set via devcontainer.json remoteEnv if using Wayland."
        status="info"
    fi

    echo ""
    echo "Configuration check complete."
    echo "Warnings above are expected at build time."
    echo "Host socket mounts must be configured in devcontainer.json."

    if [ "$status" = "warning" ]; then
        echo ""
        echo "=== Host Configuration Required ==="
        echo "Host sockets must be mounted in devcontainer.json."
        echo "See: https://github.dev/devcontainers-extra/features/blob/main/src/x11-wayland/README.md"
    fi
}

echo "=== X11/Wayland Migration Feature ==="

setup_display_vars
document_runtime_deps
check_configuration

echo ""
echo "=== X11/Wayland Migration Feature Complete ==="