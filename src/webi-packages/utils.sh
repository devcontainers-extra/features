#!/bin/bash

install_webi() {
  local USERNAME="$1"
  local PACKAGES="$2"

  check_command curl

  su - "${USERNAME}" <<EOF
    if ! command -v webi &>/dev/null; then
        echo "Installing webinstall.dev for user ${USERNAME}..."
        curl -sS https://webi.sh/webi | sh
        source ~/.config/envman/PATH.env
        echo "Webinstall.dev installation completed for user ${USERNAME}"
    fi

    if [ -n "$PACKAGES" ]; then
      echo "Installing specified packages: ${PACKAGES}"
      webi $(echo "$PACKAGES" | tr ',' ' ')
    fi
EOF
}

determine_user() {
  local USERNAME="${1:-"auto"}"
  if [ "${USERNAME}" = "auto" ] || [ "${USERNAME}" = "automatic" ]; then
    USERNAME=""
    check_command awk >/dev/null 2>&1
    POSSIBLE_USERS=("vscode" "node" "codespace" "$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)")
    for CURRENT_USER in "${POSSIBLE_USERS[@]}"; do
      if id -u "${CURRENT_USER}" >/dev/null 2>&1; then
        USERNAME=${CURRENT_USER}
        break
      fi
    done
    if [ "${USERNAME}" = "" ]; then
      USERNAME=root
    fi
  elif [ "${USERNAME}" = "none" ] || ! id -u "${USERNAME}" >/dev/null 2>&1; then
    USERNAME=root
  fi

  echo "${USERNAME}"
}

check_command() {
  local cmd=$1

  if command -v "$cmd" &>/dev/null; then
    echo "$cmd is already installed"
    return 0
  fi

  echo "$cmd not found, attempting to install..."

  if command -v apt &>/dev/null; then
    echo "Installing using apt..."
    apt update
    apt -y install --no-install-recommends "$cmd"
    return $?
  fi

  if command -v apk &>/dev/null; then
    echo "Installing using apk..."
    apk update
    apk add --no-cache "$cmd"
    return $?
  fi

  echo "Error: No supported package manager found (apt/apk)"
  return 1
}

clean() {
  if command -v apt &>/dev/null; then
    apt clean
    rm -rf /var/lib/apt/lists/*
  fi
}
