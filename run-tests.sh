#!/usr/bin/env bash

function install_bats() {
    local os_long="$( uname -a )"
    local os_short=$( uname -s | tr '[:upper:]' '[:lower:]' )
    echo "OS: $os_short / $os_long"

    [[ "$os_short" == "darwin" ]] && {
        brew install bats
    }

    [[ "$os_short" == "linux" && $os_long =~ "Ubuntu" ]] && {
        sudo apt-get install -y bats
    }

    [[ "$os_short" == "linux" ]] && {
        apk add bats --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted
    }
}

command -v "bats" || install_bats
bats test