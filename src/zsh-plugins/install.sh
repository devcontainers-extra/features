#!/usr/bin/env bash
set -x
PLUGINS=${PLUGINS:-""}
OMZSH_PLUGINS=${OMZPLUGINS:-""}
USERNAME=${USERNAME:-$_REMOTE_USER}


# Checks if packages are installed and installs them if not
check_packages() {
	if ! dpkg -s "$@" >/dev/null 2>&1; then
		if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
			echo "Running apt-get update..."
			apt-get update -y
		fi
		apt-get -y install --no-install-recommends "$@"
	fi
}


check_packages git ca-certificates

# ensure zsh is installed
if ! type zsh >/dev/null 2>&1; then
    check_packages zsh
fi

if [ "$USERNAME" = "root" ]; then
  USER_LOCATION="/root"
else
  USER_LOCATION="/home/$USERNAME"
fi

# ensure oh-my-zsh installed
if ! [ -d $USER_LOCATION/.oh-my-zsh ]; then
  check_packages wget
  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

ZSH_CONFIG="$USER_LOCATION/.zshrc"
OMZSH_PLUGINS_LOCATION="$USER_LOCATION/.oh-my-zsh/custom/plugins"

# Install custom oh-my-zsh plugins from OMZSH_PLUGINS
currdir=$(pwd)
mkdir -p "$OMZSH_PLUGINS_LOCATION"
cd "$OMZSH_PLUGINS_LOCATION" || exit

IFS=' ' read -ra plugins <<< "${OMZSH_PLUGINS}"

for plugin in "${plugins[@]}"
do
  git clone --depth 1 $plugin
done

cd "$currdir" || exit

# create configuration file if not exists
if ! [ -f "$ZSH_CONFIG" ]; then
  mkdir -p "$(dirname "$ZSH_CONFIG")" && touch "$ZSH_CONFIG"
fi

# Activate zsh plugins from PLUGINS
sed -i -e "s/plugins=.*/plugins=(git ${PLUGINS})/g" "$ZSH_CONFIG"
