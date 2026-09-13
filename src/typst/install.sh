
set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.4"

# detect architecture
architecture="$(uname -m)"
case ${architecture} in
    x86_64 | amd64)
        arch="x86_64"
        ;;
    aarch64 | arm64)
        arch="aarch64"
        ;;
    *)
        echo "(!) Architecture ${architecture} is not supported by the typst feature"
        exit 1
        ;;
esac

# target expected release asset via arch-driven release triple
asset_regex="^typst-${arch}-unknown-linux-(gnu|musl)\\.tar\\.(gz|xz)$"

# only consider stable "vX.Y.Z" tags
# pre-release tags (v0.15.0-rc.1) and legacy date based tags (v23-03-28) are deliberately ignored
release_tag_regex='^v[0-9]+\.[0-9]+\.[0-9]+$'

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/gh-release:1.0.25" \
    --option repo='typst/typst' --option binaryNames='typst' --option version="$VERSION" --option assetRegex="$asset_regex" --option releaseTagRegex="$release_tag_regex"



echo 'Done!'
