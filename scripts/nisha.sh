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
    left_icon='😎 '
    left_icon_prefix='🥺 '
    left_sep=''
    left_sep2=''
    right_sep=''
    right_sep2=''
    tmux set-option -g status-interval 60
    tmux set-option -g clock-mode-style 24

    tmux set-option -g status-left-length 100
    tmux set-option -g status-right-length 100
    tmux set-option -g message-style "bg=${background},fg=${foreground}"
    tmux set-option -g status-style "bg=${background},fg=${foreground}"

    tmux set-option -g status-left "#[bg=${purple},fg=${background}]#{?client_prefix,#[bg=${green}] ${left_icon_prefix}, ${left_icon}} #[fg=${purple},bg=${blue}]#{?client_prefix,#[fg=${green}],}${left_sep} #[bg=${blue},fg=${selection}] #S #[bg=${background},fg=${blue}]${left_sep}"

    # In future we shall expose API

    tmux set-option -g  status-right ""
    bg=${background}

    tmux set-option -ga status-right "#[fg=${orange},bg=${bg},nobold,nounderscore,noitalics] ${right_sep}#[fg=${background},bg=${orange}] #($current_dir/cpu.sh)"
    bg=${orange}

    tmux set-option -ga status-right "#[fg=${purple},bg=${bg},nobold,nounderscore,noitalics] ${right_sep}#[fg=${background},bg=${purple}] #($current_dir/network.sh)"
    bg=${purple}

    tmux set-option -ga status-right "#[fg=${blue},bg=${bg},nobold,nounderscore,noitalics] ${right_sep}#[fg=${background},bg=${blue}] #($current_dir/weather.sh)"
    powerbg=${blue}
    
    #[fg=black,bg=brightblack,nobold,noitalics,nounderscore] #[fg=white,bg=brightblack]#I #[fg=white,bg=brightblack,nobold,noitalics,nounderscore] #[fg=white,bg=brightblack]#W #F #[fg=brightblack,bg=black,nobold,noitalics,nounderscore]
    
    tmux set-window-option -g window-status-current-format "#[fg=${background},bg=${orange},nobold,noitalics,nounderscore]${left_sep} #[bg=${orange},fg=${background}] #I ${left_sep2} #W #[fg=${orange},bg=${background},nobold,noitalics,nounderscore]${left_sep}"
    tmux set-window-option -g window-status-format "#[fg=${background},bg=${selection},nobold,noitalics,nounderscore]${left_sep} #[bg=${selection},fg=${foreground}] #I ${left_sep2} #W #[fg=${selection},bg=${background},nobold,noitalics,nounderscore]${left_sep}"
    tmux set-window-option -g window-status-separator ""
}

main
