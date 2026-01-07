#!/usr/bin/env bash

set -e

source ./library_scripts.sh

# Helper function for consistent logging (robust for container environments)
log() {
    local level="$1"
    shift
    local message="$*"
    local timestamp

    # Try to get timestamp, fallback if date command fails
    if timestamp=$(date '+%Y-%m-%d %H:%M:%S' 2>/dev/null); then
        timestamp="[$timestamp]"
    else
        timestamp="[$(date 2>/dev/null || echo 'unknown')]"
    fi

    case "$level" in
        INFO)    echo "$timestamp INFO: $message" ;;
        SUCCESS) echo "$timestamp SUCCESS: $message" ;;
        WARNING) echo "$timestamp WARNING: $message" ;;
        ERROR)   echo "$timestamp ERROR: $message" >&2 ;;
        *)       echo "$timestamp $level: $message" ;;
    esac
}

# Debug logging helper (enabled when BUN_FEATURE_DEBUG is set)
debug_log() {
    if [ -n "$BUN_FEATURE_DEBUG" ]; then
        log INFO "$@"
    fi
}

log INFO "Starting Bun installation"

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
log INFO "Ensuring nanolayer is available"
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
    log WARNING "Invalid version format: '$version'. Using 'latest' instead."
    echo "latest"
}

version_for_release="$(canonicalize_version "$VERSION")"
log INFO "Using Bun version: $version_for_release"

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

log INFO "Detecting system architecture"
if ! arch_segment="$(detect_arch)"; then
    log ERROR "Failed to detect architecture"
    exit 1
fi

# Detect musl vs glibc (robust detection across multiple distros)
detect_libc() {
    # Method 1: Check for apk (Alpine)
    if [ -x "/sbin/apk" ]; then
        log INFO "Detected musl libc (Alpine package manager found)" >&2
        echo "-musl"
        return 0
    fi

    # Method 2: Check ldd output for musl
    if command -v ldd >/dev/null 2>&1; then
        if ldd --version 2>&1 | grep -qi musl; then
            log INFO "Detected musl libc (ldd output)" >&2
            echo "-musl"
            return 0
        fi
    fi

    # Method 3: Check for musl library files
    if [ -f "/lib/ld-musl-x86_64.so.1" ] || [ -f "/lib/ld-musl-aarch64.so.1" ]; then
        log INFO "Detected musl libc (library files)" >&2
        echo "-musl"
        return 0
    fi

    # Method 4: Check /proc/mounts for musl
    if grep -qi musl /proc/mounts 2>/dev/null; then
        log INFO "Detected musl libc (proc mounts)" >&2
        echo "-musl"
        return 0
    fi

    # Default to glibc
    log INFO "Using glibc (default)" >&2
    echo ""
}

log INFO "Detecting libc implementation"
if ! libc_suffix="$(detect_libc)"; then
    log ERROR "Failed to detect libc implementation"
    exit 1
fi

# Set human-readable libc name for error messages
if [ "$libc_suffix" = "-musl" ]; then
    libc_name="musl"
else
    libc_name="glibc"
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
log INFO "Building asset patterns for arch=$arch_segment, libc=${libc_suffix:-glibc}"
if ! asset_patterns_output=$(build_asset_patterns "$arch_segment" "$libc_suffix"); then
    log ERROR "Failed to build asset patterns for arch=$arch_segment, libc_suffix=$libc_suffix"
    exit 1
fi

# Convert to array (with debugging)
    log INFO "Asset patterns built: $asset_patterns_output"

# Convert to array - use a more reliable method
debug_log "Debug: asset_patterns_output='$asset_patterns_output'"
debug_log "Debug: asset_patterns_output contains newline: $([[ "$asset_patterns_output" == *$'\n'* ]] && echo 'YES' || echo 'NO')"

# Split by newlines and create array
asset_patterns=()
while IFS= read -r line; do
    if [ -n "$line" ]; then
        asset_patterns+=("$line")
    fi
done <<< "$asset_patterns_output"

debug_log "Debug: asset_patterns array has ${#asset_patterns[@]} elements"
for i in "${!asset_patterns[@]}"; do
    debug_log "Debug: asset_patterns[$i] = '${asset_patterns[$i]}'"
done

# Verify we have asset patterns
if [ ${#asset_patterns[@]} -eq 0 ]; then
    log ERROR "No asset patterns generated for arch=$arch_segment, libc_suffix=$libc_suffix"
    log ERROR "asset_patterns_output was: '$asset_patterns_output'"
    exit 1
fi

# Try each asset pattern until one succeeds
install_bun() {
    log INFO "install_bun function called with ${#asset_patterns[@]} asset patterns"

    if [ ${#asset_patterns[@]} -eq 0 ]; then
        log ERROR "install_bun: No asset patterns provided!"
        return 1
    fi

    for asset_regex in "${asset_patterns[@]}"; do
        log INFO "Attempting to install Bun with asset regex: $asset_regex"
        debug_log "Debug: asset_regex = '$asset_regex'"

        log INFO "Running nanolayer installation command..."
        log INFO "Command: $nanolayer_location install devcontainer-feature ghcr.io/devcontainers-extra/features/gh-release:1"
        log INFO "Options: repo=oven-sh/bun, binaryNames=bun, version=$version_for_release"
        log INFO "Options: assetRegex=$asset_regex, releaseTagRegex=$release_tag_regex"

        # Verify nanolayer_location is set
        if [ -z "$nanolayer_location" ]; then
            log ERROR "nanolayer_location is not set!"
            return 1
        fi

        debug_log "Debug: nanolayer_location = '$nanolayer_location'"
        debug_log "Debug: nanolayer_location exists: $([ -x "$nanolayer_location" ] && echo 'YES' || echo 'NO')"

        debug_log "Debug: About to execute nanolayer command for asset: $asset_regex"

        if nanolayer_output=$($nanolayer_location \
            install \
            devcontainer-feature \
            "ghcr.io/devcontainers-extra/features/gh-release:1" \
            --option repo='oven-sh/bun' \
            --option binaryNames='bun' \
            --option version="$version_for_release" \
            --option assetRegex="$asset_regex" \
            --option releaseTagRegex="$release_tag_regex" 2>&1); then

            log INFO "Nanolayer command succeeded"
            log INFO "Nanolayer output: $nanolayer_output"

            # Check if bun binary was actually installed
            if [ -f "/usr/local/bin/bun" ]; then
                log INFO "Bun binary found at /usr/local/bin/bun"
                log INFO "Bun binary permissions: $(ls -la /usr/local/bin/bun)"
            else
                log ERROR "Bun binary NOT found at /usr/local/bin/bun after installation"
                log ERROR "Checking /usr/local/bin contents: $(ls -la /usr/local/bin/ 2>/dev/null || echo 'Directory not accessible')"

                # Try to find where bun might have been installed
                log INFO "Searching for bun binary in common locations..."
                find /usr/local -name "*bun*" -type f 2>/dev/null || log INFO "No bun binaries found in /usr/local"
            fi
            log SUCCESS "Successfully installed Bun with asset regex: $asset_regex"
            return 0
        else
            log WARNING "Failed to install Bun with asset regex: $asset_regex, trying next pattern..."
            log WARNING "Nanolayer output: $nanolayer_output"
        fi
    done

    log ERROR "Failed to install Bun. No asset patterns matched."
    log ERROR "Troubleshooting information:"
    log ERROR "- Architecture: $arch_segment"
    log ERROR "- Libc: ${libc_name}"
    log ERROR "- Version: $version_for_release"
    log ERROR "- Asset patterns tried: ${asset_patterns[*]}"
    log ERROR "Check https://github.com/oven-sh/bun/releases for available assets"
    return 1
}

# Attempt installation
log INFO "Starting Bun installation process..."
log INFO "About to call install_bun function with ${#asset_patterns[@]} patterns"

if ! install_bun; then
    log ERROR "install_bun function failed"
    exit 1
fi

log INFO "Bun installation process completed"

# Provide a convenient bunx shim
if [ -x "/usr/local/bin/bun" ] && ! [ -x "/usr/local/bin/bunx" ]; then
    cat >/usr/local/bin/bunx <<'EOF'
#!/usr/bin/env bash
exec bun x "$@"
EOF
    chmod +x /usr/local/bin/bunx
fi

log SUCCESS "Bun installation completed successfully"

# Verify the installation worked
log INFO "Verifying Bun installation..."
if [ -x "/usr/local/bin/bun" ]; then
    log INFO "Bun binary is executable at /usr/local/bin/bun"
    if bun_binary_version=$(/usr/local/bin/bun --version 2>&1); then
        log INFO "Bun version check successful: $bun_binary_version"
    else
        log INFO "Bun binary exists but version check failed - this may be environment-specific"
        log INFO "Binary info: $(file /usr/local/bin/bun 2>/dev/null || echo 'file command failed')"
        log INFO "Library dependencies: $(ldd /usr/local/bin/bun 2>/dev/null || echo 'ldd command failed')"

        # Try to run with explicit library path for debugging
        if [ -d "/lib" ] && [ -d "/usr/lib" ]; then
            log INFO "Attempting to run bun with library path for debugging..."
            if bun_binary_version=$(LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib /usr/local/bin/bun --version 2>&1); then
                log INFO "Bun version check successful with LD_LIBRARY_PATH: $bun_binary_version"
            else
                log INFO "Bun version check still failed with LD_LIBRARY_PATH"
            fi
        fi
    fi
else
    log ERROR "Bun binary not found or not executable at /usr/local/bin/bun"
    log ERROR "Checking if bun exists: $([ -f "/usr/local/bin/bun" ] && echo 'YES' || echo 'NO')"
    if [ -f "/usr/local/bin/bun" ]; then
        log ERROR "Bun file exists but is not executable. Permissions: $(ls -la /usr/local/bin/bun)"
        log ERROR "Attempting to make executable..."
        chmod +x /usr/local/bin/bun
        if [ -x "/usr/local/bin/bun" ]; then
            log INFO "Fixed: Bun binary is now executable"
        else
            log ERROR "Failed to make Bun binary executable"
        fi
    else
        log ERROR "Bun binary file does not exist at /usr/local/bin/bun"
    fi
fi
