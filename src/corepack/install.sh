
set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.6"

if ! type npm >/dev/null 2>&1; then
    $nanolayer_location \
        install \
        devcontainer-feature \
        "ghcr.io/devcontainers/features/node:2" \
        --option version="lts" \
        --option pnpmVersion="none"
    export NVM_DIR=/usr/local/share/nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

# Remove standalone yarn/pnpm shims that collide with corepack's bin entries
npm uninstall -g pnpm yarn >/dev/null 2>&1 || true

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/npm-package:1.0.5" \
    --option package='corepack' --option version="$VERSION"

echo 'Done!'
