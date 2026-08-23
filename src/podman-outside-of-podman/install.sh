#!/usr/bin/env bash

set -e

PODMAN_VERSION="${VERSION:-latest}"
REMOTE="${REMOTE:-true}"

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

detect_arch() {
    local arch
    arch=$(uname -m)
    case "$arch" in
        x86_64|amd64)
            echo "amd64"
            ;;
        aarch64|arm64)
            echo "arm64"
            ;;
        armv7l|armhf)
            echo "armhf"
            ;;
        *)
            echo "$arch"
            ;;
    esac
}

detect_os() {
    local os
    os=$(uname -s)
    case "$os" in
        Linux)
            echo "linux"
            ;;
        *)
            echo "linux"
            ;;
    esac
}

get_latest_podman_version() {
    local latest_version
    latest_version=$(curl -fsSL "https://api.github.com/repos/containers/podman/releases/latest" 2>/dev/null | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/' | sed 's/^v//')
    echo "$latest_version"
}

install_podman_from_github() {
    local arch
    arch=$(detect_arch)
    local os
    os=$(detect_os)
    local version="$1"

    echo "Installing Podman ${version} from GitHub releases..."

    local tmp_dir
    tmp_dir=$(mktemp -d)
    cleanup() {
        rm -rf "$tmp_dir"
    }
    trap cleanup EXIT

    local binary_name="podman-remote-static-${os}_${arch}.tar.gz"
    local download_url="https://github.com/containers/podman/releases/download/v${version}/${binary_name}"

    echo "Downloading: $download_url"

    if curl -fsSL "$download_url" -o "$tmp_dir/$binary_name" 2>/dev/null; then
        echo "Download successful. Extracting..."
        tar -xzf "$tmp_dir/$binary_name" -C "$tmp_dir"

        local podman_bin
        podman_bin=$(find "$tmp_dir" -name "podman-remote-static-${os}_${arch}" -type f 2>/dev/null | head -1)

        if [ -n "$podman_bin" ] && [ -x "$podman_bin" ]; then
            mkdir -p /usr/local/bin
            cp "$podman_bin" /usr/local/bin/podman
            chmod +x /usr/local/bin/podman
            echo "Podman ${version} installed successfully to /usr/local/bin/podman"
            return 0
        fi
    fi

    echo "GitHub release download failed. Falling back to repository installation."
    return 1
}

install_podman_apt() {
    local version_arg=""

    if [ "$PODMAN_VERSION" != "latest" ]; then
        version_arg="podman=$PODMAN_VERSION"
    fi

    apt-get update -y
    apt-get install -y --no-install-recommends \
        $version_arg \
        podman \
        conmon \
        crun

    rm -rf /var/lib/apt/lists/*
}

install_podman_dnf() {
    local version_arg=""

    if [ "$PODMAN_VERSION" != "latest" ]; then
        version_arg="podman-$PODMAN_VERSION"
    fi

    dnf install -y $version_arg \
        podman \
        conmon \
        crun

    dnf clean all
}

install_podman_pacman() {
    local version_arg=""

    if [ "$PODMAN_VERSION" != "latest" ]; then
        version_arg="podman=${PODMAN_VERSION}"
    fi

    pacman -Sy --noconfirm $version_arg \
        podman \
        conmon \
        crun
}

install_podman_zypper() {
    local version_arg=""

    if [ "$PODMAN_VERSION" != "latest" ]; then
        version_arg="podman=${PODMAN_VERSION}"
    fi

    zypper --gpg-auto-import-keys install -y $version_arg \
        podman \
        conmon \
        crun

    rm -rf /var/cache/zypper/*
}

install_podman_deps_apt() {
    apt-get update -y
    apt-get install -y --no-install-recommends \
        conmon \
        crun \
        slirp4netns \
        fuse-overlayfs \
        uidmap \
        containernetworking-plugins
    rm -rf /var/lib/apt/lists/*
}

install_podman_deps_dnf() {
    dnf install -y \
        containers-common \
        conmon \
        crun \
        slirp4netns \
        fuse-overlayfs \
        shadow-utils-subordinate \
        containernetworking-plugins
    dnf clean all
}

install_podman_deps_pacman() {
    pacman -Sy --noconfirm \
        containers-common \
        conmon \
        crun \
        slirp4netns \
        fuse-overlays \
        shadow \
        containernetworking-plugins
}

install_podman_deps_zypper() {
    zypper --gpg-auto-import-keys install -y \
        containers-common \
        conmon \
        crun \
        slirp4netns \
        fuse-overlayfs \
        shadow \
        containernetworking-plugins
    rm -rf /var/cache/zypper/*
}

configure_remote() {
    if [ "$REMOTE" = "true" ]; then
        mkdir -p /home/podman/.local/share/containers 2>/dev/null || true

        if [ -n "$PODMAN_HOST" ]; then
            echo "PODMAN_HOST=$PODMAN_HOST" >> /etc/default/podman 2>/dev/null || true
        fi

        mkdir -p /etc/containers
        if [ ! -f /etc/containers/policy.json ]; then
            cat > /etc/containers/policy.json << 'EOF'
{
    "default": [
        {
            "type": "insecureAcceptAny"
        }
    ]
}
EOF
        fi
    fi
}

configure_user() {
    mkdir -p /home/$USER/.config/containers 2>/dev/null || true
    mkdir -p /home/$USER/.local/share/containers 2>/dev/null || true

    chmod 700 /home/$USER/.config/containers 2>/dev/null || true
    chmod 700 /home/$USER/.local/share/containers 2>/dev/null || true
}

check_podman_configuration() {
    local status="success"

    if [ ! -S "/run/podman/podman.sock" ] && [ ! -S "/var/run/podman/podman.sock" ]; then
        echo "WARNING: Podman API socket not found at /run/podman/podman.sock"
        echo "         Mount via devcontainer.json at container start."
        echo "         Documentation: https://github.dev/devcontainers-features/blob/main/src/podman-outside-of-podman/README.md#example-devcontainerjson"
        status="warning"
    fi

    if [ -z "$PODMAN_HOST" ]; then
        echo "INFO: PODMAN_HOST not set."
        echo "      Set via devcontainer.json environmentVariables."
        echo "      Documentation: https://github.dev/devcontainers-features/blob/main/src/podman-outside-of-podman/README.md#example-devcontainerjson"
        status="info"
    fi

    if ! command -v podman >/dev/null 2>&1; then
        echo "ERROR: podman binary not found after installation."
        echo "      Check supported distributions."
        echo "      Documentation: https://github.dev/devcontainers-features/blob/main/src/podman-outside-of-podman/README.md#supported-distributions"
        status="error"
    fi

    echo ""
    echo "Configuration check complete."
    echo "Warnings above are expected at build time."

    if [ "$status" = "error" ]; then
        echo ""
        echo "=== Installation Failed ==="
        echo "See documentation for supported distributions."
        exit 1
    fi

    if [ "$status" = "warning" ]; then
        echo ""
        echo "=== Host Configuration Required ==="
        echo "Podman endpoint must be provided in devcontainer.json."
        echo "See: https://github.dev/devcontainers-features/blob/main/src/podman-outside-of-podman/README.md"
    fi
}

echo "=== Podman Outside-of-Podman Feature Installation ==="

local_distro=$(detect_distro)
echo "Detected distribution: $local_distro"

if [ "$PODMAN_VERSION" = "latest" ]; then
    echo "Installing Podman (latest) via GitHub releases..."

    case "$local_distro" in
        debian|ubuntu|kali|linuxmint)
            install_podman_deps_apt
            ;;
        fedora|rhel|centos|rocky|almalinux)
            install_podman_deps_dnf
            ;;
        arch|manjaro)
            install_podman_deps_pacman
            ;;
        opensuse*|suse*)
            install_podman_deps_zypper
            ;;
        *)
            install_podman_deps_apt
            ;;
    esac

    latest_version=$(get_latest_podman_version)
    if [ -n "$latest_version" ]; then
        echo "Latest Podman version from GitHub: $latest_version"
        if install_podman_from_github "$latest_version"; then
            echo "Podman ${latest_version} installed successfully"
        else
            echo "GitHub release failed, falling back to repository packages"
            case "$local_distro" in
                debian|ubuntu|kali|linuxmint)
                    install_podman_apt
                    ;;
                fedora|rhel|centos|rocky|almalinux)
                    install_podman_dnf
                    ;;
                arch|manjaro)
                    install_podman_pacman
                    ;;
                opensuse*|suse*)
                    install_podman_zypper
                    ;;
                *)
                    install_podman_apt
                    ;;
            esac
        fi
    else
        echo "Could not determine latest version, falling back to repository packages"
        case "$local_distro" in
            debian|ubuntu|kali|linuxmint)
                install_podman_apt
                ;;
            fedora|rhel|centos|rocky|almalinux)
                install_podman_dnf
                ;;
            arch|manjaro)
                install_podman_pacman
                ;;
            opensuse*|suse*)
                install_podman_zypper
                ;;
            *)
                install_podman_apt
                ;;
        esac
    fi
else
    echo "Installing specific version: $PODMAN_VERSION via repository"
    case "$local_distro" in
        debian|ubuntu|kali|linuxmint)
            install_podman_apt
            ;;
        fedora|rhel|centos|rocky|almalinux)
            install_podman_dnf
            ;;
        arch|manjaro)
            install_podman_pacman
            ;;
        opensuse*|suse*)
            install_podman_zypper
            ;;
        *)
            install_podman_apt
            ;;
    esac
fi

if [ "$REMOTE" = "true" ]; then
    echo "Configuring Podman for remote operation..."
    configure_remote
fi

echo "Configuring user directories..."
configure_user

check_podman_configuration

echo "Verifying Podman installation..."
if command -v podman >/dev/null 2>&1; then
    echo "Podman version: $(podman --version)"
else
    echo "Warning: Podman binary not found in PATH after installation"
fi

echo "=== Podman Outside-of-Podman Feature Installation Complete ==="
