
set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.0"


# Add extras to the requested package
PACKAGE="meltano"
if [ -n "$EXTRAS" ]; then
    PACKAGE="$PACKAGE[$EXTRAS]"
fi

# Use the python3.x interpreter if a version starting with 3 is given
# Otherwise, use the default python3 interpreter
if [[ "$PYTHONVERSION" == 3.* ]]; then
    INTERPRETER="python$PYTHONVERSION"
else
    INTERPRETER="python3"
fi



$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/pipx-package:1.1.9" \
    --option package='$PACKAGE' --option version="$VERSION" --option interpreter='$INTERPRETER'



echo 'Done!'

