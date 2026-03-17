#------------------------------------------------------------------------------
# General
#------------------------------------------------------------------------------
set -g fish_greeting
set -gx EDITOR hx
set -gx SHELL /opt/homebrew/bin/fish
set -g fish_key_bindings fish_vi_key_bindings
set -g fish_term24bit 1

# man - use bat as colorizing pager
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# n - node version manager
set -gx N_PREFIX $HOME/.n

#------------------------------------------------------------------------------
# Gruvbox color scheme
#------------------------------------------------------------------------------
set -g fish_color_normal normal
set -g fish_color_command blue
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection cyan --bold
set -g fish_color_end green
set -g fish_color_error brred
set -g fish_color_comment red
set -g fish_color_autosuggestion brblack
set -g fish_color_selection white --bold --background=brblack
set -g fish_color_search_match bryellow --background=brblack
set -g fish_color_operator brcyan
set -g fish_color_escape brcyan
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_user brgreen
set -g fish_color_host normal
set -g fish_color_host_remote yellow
set -g fish_color_status red
set -g fish_color_cancel -r
set -g fish_color_valid_path --underline

set -g fish_pager_color_completion normal
set -g fish_pager_color_description yellow -i
set -g fish_pager_color_prefix normal --bold --underline
set -g fish_pager_color_progress brwhite --background=cyan
set -g fish_pager_color_selected_background -r
