#!/usr/bin/env bash

get_ssid() {
    # TODO: Mac and Windows

    SSID=$(iw dev | sed -nr 's/^\t\tssid (.*)/\1/p')
    if [ -n "$SSID" ]; then
        printf '🌐%s' "$SSID"
    else
        echo '🔌 Ethernet'
    fi
}

main() {
    network='❌ Offline'
    if ping -q -c 1 -W 1 www.google.com &>/dev/null; then
        network="$(get_ssid)"
    fi

    echo "${network}"
}

main
