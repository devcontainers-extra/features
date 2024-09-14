
set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.5.6"




release_tag_regex=$(if ! [ -z $RELEASETAGREGEX ]; then echo --release-tag-regex "${RELEASETAGREGEX}" ; fi)
asset_regex_cmd=$(if ! [ -z $ASSETREGEX ]; then echo --asset-regex "${ASSETREGEX}" ; fi)
lib_name_cmd=$(if ! [ -z $LIBNAME ]; then echo --lib-name "${LIBNAME}" ; fi)
$nanolayer_location \
   install gh-release \
   "$REPO" \
   "$BINARYNAMES" --force \
   --version "$VERSION" --bin-location "$BINLOCATION"  --lib-location "$LIBLOCATION"  $asset_regex_cmd $lib_name_cmd $release_tag_regex $ADDITIONALFLAGS

