#!/usr/bin/env bash

# Nisha: Dark colorscheme for Tmux
# Copyright (C) 2020  Aniket Bhattacharyea

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
