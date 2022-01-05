#!/usr/bin/env bash

function install_bats() {
    local os_long="$( uname -a )"
    local os_short=$( uname -s | tr '[:upper:]' '[:lower:]' )
    echo "OS: $os_short / $os_long"

    if [[ "$os_short" == "darwin" ]]; then
        brew install bats
    elif [[ "$os_short" == "linux" && $os_long =~ "Ubuntu" ]]; then
        sudo apt-get install -y bats
    elif [[ "$os_short" == "linux" ]]; then
        apk add bats --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted
    fi
}

command -v "bats" > /dev/null 2>&1 || install_bats
bats test