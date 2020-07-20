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


get_tmux_option() {
  local option=$1
  local default_value=$2
  local option_value=$(tmux show-option -gqv "$option")
  if [ -z $option_value ]; then
    echo $default_value
  else
    echo $option_value
  fi
}

main() {
    backgrounddark='#262626'
    background='#191a21'
    red='#f14358'
    darkred='#ef233c'
    orange='#ff7d55'
    darkorange='#ff5622'
    blue='#99b7c2'
    darkblue='#4f7684'
    yellow='#c2aa91'
    darkyellow='#836648'
    green='#6bc29a'
    darkgreen='#307555'
    pink='#ab797a'
    darkpink='#75494a'
    foreground='#efe6dd'
    purple='#a27fc2'
    darkpurple='#5e3c7d'
    comment='#767b8b'
    selection='#373a42'

    current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    left_icon=$(get_tmux_option "@nisha-left-icon" '😎 ')
    left_icon_prefix=$(get_tmux_option "@nisha-left-icon-prefix" '🥺 ')
    left_sep=$(get_tmux_option "@nisha-left-sep" '')
    left_sep2=$(get_tmux_option "@nisha-left-sep2" '')
    right_sep=$(get_tmux_option "@nisha-right-sep" '')

    tmux set-option -g status-interval 60
    tmux set-option -g clock-mode-style 24

    tmux set-option -g status-left-length 100
    tmux set-option -g status-right-length 100
    tmux set-option -g message-style "bg=${background},fg=${foreground}"
    tmux set-option -g status-style "bg=${background},fg=${foreground}"

    tmux set-option -g status-left "#[bg=${purple},fg=${background}]#{?client_prefix,#[bg=${red}] ${left_icon_prefix}, ${left_icon}} #[fg=${purple},bg=${blue}]#{?client_prefix,#[fg=${red}],}${left_sep} #[bg=${blue},fg=${selection}] #S #[bg=${background},fg=${blue}]${left_sep}"

    # In future we shall expose API

    tmux set-option -g  status-right ""
    bg=${background}

    tmux set-option -ga status-right "#[fg=${orange},bg=${bg},nobold,nounderscore,noitalics] ${right_sep}#[fg=${background},bg=${orange}] #($current_dir/cpu.sh) #[fg=${background},bg=${orange}]${right_sep}"

    tmux set-option -ga status-right "#[fg=${purple},bg=${bg},nobold,nounderscore,noitalics] ${right_sep}#[fg=${background},bg=${purple}] #($current_dir/network.sh) #[fg=${background},bg=${purple}]${right_sep}"

    tmux set-option -ga status-right "#[fg=${blue},bg=${bg},nobold,nounderscore,noitalics] ${right_sep}#[fg=${background},bg=${blue}] #($current_dir/weather.sh) #[fg=${background},bg=${blue}]${right_sep}"
    
    
    tmux set-window-option -g window-status-current-format "#[fg=${background},bg=${orange},nobold,noitalics,nounderscore]${left_sep} #[bg=${orange},fg=${background}] #I ${left_sep2} #W #[fg=${orange},bg=${background},nobold,noitalics,nounderscore]${left_sep}"
    tmux set-window-option -g window-status-format "#[fg=${background},bg=${selection},nobold,noitalics,nounderscore]${left_sep} #[bg=${selection},fg=${foreground}] #I ${left_sep2} #W #[fg=${selection},bg=${background},nobold,noitalics,nounderscore]${left_sep}"
    tmux set-window-option -g window-status-separator ""

    tmux set-window-option -g window-status-bell-style "fg=${background},bg=${yellow},blink,bold"

    tmux set-window-option -g window-status-activity-style "bg=${green},fg=${background},bold"

    tmux set-window-option -g window-status-last-style "fg=${blue}"
}

main
