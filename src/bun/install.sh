#!/usr/bin/env bash

set -e

source ./library_scripts.sh

echo "Starting Bun installation"

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
echo "Ensuring nanolayer is available"
# Initialize variable to suppress shellcheck warning (assigned by ensure_nanolayer function)
nanolayer_location=""
ensure_nanolayer nanolayer_location "v0.5.6"

# Canonicalize VERSION for Bun's tag scheme when pinning
canonicalize_version() {
    local version="$1"

    if [ "$version" = "latest" ] || [ -z "$version" ]; then
        echo "latest"
        return 0
    fi

    # Remove any leading/trailing whitespace
    version="$(echo "$version" | xargs)"

    # Already in correct format
    if [[ "$version" =~ ^bun-v[0-9]+\.[0-9]+\.[0-9]+ ]]; then
        echo "$version"
        return 0
    fi

    # Remove 'bun-' prefix if present
    if [[ "$version" =~ ^bun- ]]; then
        version="${version#bun-}"
    fi

    # Handle versions starting with 'v'
    if [[ "$version" =~ ^v[0-9]+\.[0-9]+\.[0-9]+ ]]; then
        echo "bun-$version"
        return 0
    fi

    # Handle plain version numbers
    if [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+ ]]; then
        echo "bun-v$version"
        return 0
    fi

    # Invalid version format
    echo "WARNING: Invalid version format: '$version'. Using 'latest' instead." >&2
    echo "latest"
}

# shellcheck disable=SC2153
# VERSION is provided by the devcontainer features framework
version_for_release="$(canonicalize_version "$VERSION")"
echo "Using Bun version: $version_for_release"

# Figure out arch and libc to disambiguate Bun's multiple Linux assets
detect_arch() {
    local arch
    arch="$(uname -m)"

    case "$arch" in
        x86_64|amd64)
            echo "x64"
            ;;
        aarch64|arm64)
            echo "aarch64"
            ;;
        *)
            # Log warning for unsupported architectures
            echo "WARNING: Architecture '$arch' is not supported by Bun" >&2
            echo "WARNING: Bun only supports x64 and aarch64 architectures" >&2
            echo "WARNING: Available assets can be found at: https://github.com/oven-sh/bun/releases" >&2
            echo "$arch"
            ;;
    esac
}

echo "Detecting system architecture"
if ! arch_segment="$(detect_arch)"; then
    echo "ERROR: Failed to detect architecture" >&2
    exit 1
fi

# Detect musl vs glibc (robust detection across multiple distros)
detect_libc() {
    # Method 1: Check for apk (Alpine)
    if [ -x "/sbin/apk" ]; then
        echo "-musl"
        return 0
    fi

    # Method 2: Check ldd output for musl
    if command -v ldd >/dev/null 2>&1; then
        if ldd --version 2>&1 | grep -qi musl; then
            echo "-musl"
            return 0
        fi
    fi

    # Method 3: Check for musl library files
    if [ -f "/lib/ld-musl-x86_64.so.1" ] || [ -f "/lib/ld-musl-aarch64.so.1" ]; then
        echo "-musl"
        return 0
    fi

    # Method 4: Check /proc/mounts for musl
    if grep -qi musl /proc/mounts 2>/dev/null; then
        echo "-musl"
        return 0
    fi

    # Default to glibc
    echo ""
}

echo "Detecting libc implementation"
if ! libc_suffix="$(detect_libc)"; then
    echo "ERROR: Failed to detect libc implementation" >&2
    exit 1
fi

# Build asset regex based on architecture and libc
# - x64: Use baseline builds for widest CPU compatibility
# - aarch64: Use non-baseline builds since baseline doesn't exist for ARM64
if [ "$arch_segment" = "x64" ]; then
    # For x64, try baseline first, then fallback to non-baseline
    asset_regex="^bun-linux-x64${libc_suffix}-baseline\\.zip$"
else
    # For aarch64, use non-baseline since baseline doesn't exist
    asset_regex="^bun-linux-aarch64${libc_suffix}\\.zip$"
fi

# Bun tags are of the form 'bun-vX.Y.Z'; constrain tag discovery accordingly
release_tag_regex="^bun-v"

# Try multiple asset regex patterns for robust fallback support
# Build the ordered list of asset regex patterns.
# For x64, we prefer "baseline" first for widest CPU compatibility across
# older/varied machines, then fall back to non-baseline. For aarch64, Bun does
# not publish baseline variants, so we use standard builds.
build_asset_patterns() {
    local arch="$1"
    local libc="$2"

    case "$arch" in
        x64)
            if [ "$libc" = "-musl" ]; then
                echo "^bun-linux-x64-musl-baseline\\.zip$"
                echo "^bun-linux-x64-musl\\.zip$"
            else
                echo "^bun-linux-x64-baseline\\.zip$"
                echo "^bun-linux-x64\\.zip$"
            fi
            return 0
            ;;
        aarch64)
            if [ "$libc" = "-musl" ]; then
                echo "^bun-linux-aarch64-musl\\.zip$"
            else
                echo "^bun-linux-aarch64\\.zip$"
            fi
            return 0
            ;;
        *)
            echo "ERROR: Unsupported architecture '$arch'" >&2
            echo "ERROR: Bun only supports x64 and aarch64 architectures" >&2
            echo "ERROR: Available assets can be found at: https://github.com/oven-sh/bun/releases" >&2
            return 1
            ;;
    esac
}

# Build asset patterns for current architecture
if ! asset_patterns_output=$(build_asset_patterns "$arch_segment" "$libc_suffix"); then
    echo "ERROR: Failed to build asset patterns for arch=$arch_segment, libc_suffix=$libc_suffix" >&2
    exit 1
fi

# Convert to array - use a more reliable method
# Split by newlines and create array
asset_patterns=()
while IFS= read -r line; do
    if [ -n "$line" ]; then
        asset_patterns+=("$line")
    fi
done <<< "$asset_patterns_output"

# Verify we have asset patterns
if [ ${#asset_patterns[@]} -eq 0 ]; then
    echo "ERROR: No asset patterns generated for arch=$arch_segment, libc_suffix=$libc_suffix" >&2
    echo "ERROR: asset_patterns_output was: '$asset_patterns_output'" >&2
    exit 1
fi

# Try each asset pattern until one succeeds
install_bun() {
    if [ ${#asset_patterns[@]} -eq 0 ]; then
        echo "ERROR: install_bun: No asset patterns provided!" >&2
        return 1
    fi

    for asset_regex in "${asset_patterns[@]}"; do
        if $nanolayer_location \
            install \
            devcontainer-feature \
            "ghcr.io/devcontainers-extra/features/gh-release:1" \
            --option repo='oven-sh/bun' \
            --option binaryNames='bun' \
            --option version="$version_for_release" \
            --option assetRegex="$asset_regex" \
            --option releaseTagRegex="$release_tag_regex" 2>&1; then
            return 0
        fi
    done

    echo "ERROR: Failed to install Bun. No asset patterns matched." >&2
    echo "ERROR: Troubleshooting information:" >&2
    echo "ERROR: - Architecture: $arch_segment" >&2
    echo "ERROR: - Libc suffix: ${libc_suffix:-(none/glibc)}" >&2
    echo "ERROR: - Version: $version_for_release" >&2
    echo "ERROR: - Asset patterns tried: ${asset_patterns[*]}" >&2
    echo "ERROR: Check https://github.com/oven-sh/bun/releases for available assets" >&2
    return 1
}

# Attempt installation
if ! install_bun; then
    echo "ERROR: install_bun function failed" >&2
    exit 1
fi

echo "Bun installation process completed"

# Provide a convenient bunx shim
if [ -x "/usr/local/bin/bun" ] && ! [ -x "/usr/local/bin/bunx" ]; then
    cat >/usr/local/bin/bunx <<'EOF'
#!/usr/bin/env bash
exec bun x "$@"
EOF
    chmod +x /usr/local/bin/bunx
fi

echo "Bun installation completed successfully"
