
set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.5"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/npm-package:1.0.3" \
    --option package='@hyperupcall/autoenv' --option version="$VERSION"



echo 'In order to enable autoenv , execute `source $(npm root -g)/@hyperupcall/autoenv/activate.sh` in your shell'

