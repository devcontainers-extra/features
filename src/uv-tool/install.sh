#!/usr/bin/env bash

set -e

UV_VERSION="${UV_VERSION:-"latest"}"
PACKAGE="${PACKAGE:-""}"
FROM="${FROM:-""}"
WITH="${WITH:-""}"
WITH_EXECUTABLES_FROM="${WITH_EXECUTABLES_FROM:-""}"
PYTHON="${PYTHON:-""}"

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

# Validate required parameters
if [ -z "${PACKAGE}" ]; then
    echo "Error: PACKAGE option is required"
    exit 1
fi

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.6"

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/uv:1" \
    --option version="$UV_VERSION"

# Determine the appropriate non-root user
if [ "${USERNAME}" = "auto" ] || [ "${USERNAME}" = "automatic" ]; then
    USERNAME=""
    possible_users=("vscode" "node" "codespace" "$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)")
    for current_user in "${possible_users[@]}"; do
        if id -u "${current_user}" > /dev/null 2>&1; then
            USERNAME=${current_user}
            break
        fi
    done
    if [ "${USERNAME}" = "" ]; then
        USERNAME=root
    fi
elif [ "${USERNAME}" = "none" ] || ! id -u "${USERNAME}" > /dev/null 2>&1; then
    USERNAME=root
fi

uv_args=("${PACKAGE}")

[ -n "${FROM}" ] && uv_args+=(--from "${FROM}")
[ -n "${WITH_EXECUTABLES_FROM}" ] && uv_args+=(--with-executables-from "${WITH_EXECUTABLES_FROM}")
[ -n "${PYTHON}" ] && uv_args+=(--python "${PYTHON}")

# Convert space-delimited WITH packages to multiple --with flags
if [ -n "${WITH}" ]; then
    read -ra with_array <<<"${WITH}"
    for pkg in "${with_array[@]}"; do
        [ -n "$pkg" ] && uv_args+=(--with "$pkg")
    done
fi

if [ "${USERNAME}" != "root" ] && [ "${USERNAME}" != "" ]; then
    echo "Installing ${PACKAGE} for user ${USERNAME}..."
    # Export the uv_args array as a properly quoted string
    uv_cmd="uv tool install $(printf '%q ' "${uv_args[@]}")"
    sudo -u "${USERNAME}" bash -c "
        export PATH=\"/home/${USERNAME}/.local/bin:\$PATH\"
        ${uv_cmd}
    "
else
    echo "Installing ${PACKAGE} for root..."
    uv tool install "${uv_args[@]}"
fi

echo 'Done!'
