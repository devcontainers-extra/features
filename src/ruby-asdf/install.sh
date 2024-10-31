
set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.4"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/apt-get-packages:1.0.6" \
    --option packages='curl,ca-certificates,software-properties-common,build-essential,gnupg2,libreadline-dev,procps,dirmngr,gawk,autoconf,automake,bison,libffi-dev,libgdbm-dev,libncurses5-dev,libsqlite3-dev,libtool,libyaml-dev,pkg-config,sqlite3,zlib1g-dev,libgmp-dev,libssl-dev'



$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/asdf-package:1.0.8" \
    --option plugin='ruby' --option version="$VERSION"



echo 'Done!'

