#------------------------------------------------------------------------------
# User settings
#------------------------------------------------------------------------------
set -g fish_greeting # no greeting
set -gx EDITOR hx # editor
set -g fish_key_bindings fish_vi_key_bindings # vi bindings
set -g fish_term24bit 1 # force true color

# pnpm start
set -gx PNPM_HOME "/Users/ross/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

#------------------------------------------------------------------------------
# Fisher - pkg man installs are managed via fish_variable lol
#------------------------------------------------------------------------------
# fisher - manages itself
set -ga _fisher_jorgebucaran_2F_fisher_files ~/.config/fish/functions/fisher.fish
set -ga _fisher_jorgebucaran_2F_fisher_files ~/.config/fish/completions/fisher.fish

# hydro - speedy git prompt
set -ga _fisher_jorgebucaran_2F_hydro_files ~/.config/fish/functions/fish_mode_prompt.fish
set -ga _fisher_jorgebucaran_2F_hydro_files ~/.config/fish/functions/fish_prompt.fish
set -ga _fisher_jorgebucaran_2F_hydro_files ~/.config/fish/conf.d/hydro.fish

#------------------------------------------------------------------------------
# Plugin conf
#------------------------------------------------------------------------------
# Hydro - prompt with Gruvbox colors
set -g hydro_multiline true
set -g hydro_color_pwd dbc4a1
set -g hydro_color_git 504945
set -g hydro_color_prompt d79921

#------------------------------------------------------------------------------
# Default settings - here to be copied by conf.d to not have to track
#                    fish_variables file
#------------------------------------------------------------------------------
# set -g fish_color_autosuggestion brblack
# set -g fish_color_cancel \x2dr
# set -g fish_color_command blue
# set -g fish_color_comment red
# set -g fish_color_cwd green
# set -g fish_color_cwd_root red
# set -g fish_color_end green
# set -g fish_color_error brred
# set -g fish_color_escape brcyan
# set -g fish_color_history_current \x2d\x2dbold
# set -g fish_color_host normal
# set -g fish_color_host_remote yellow
# set -g fish_color_normal normal
# set -g fish_color_operator brcyan
# set -g fish_color_param cyan
# set -g fish_color_quote yellow
# set -g fish_color_redirection cyan\x1e\x2d\x2dbold
# set -g fish_color_search_match bryellow\x1e\x2d\x2dbackground\x3dbrblack
# set -g fish_color_selection white\x1e\x2d\x2dbold\x1e\x2d\x2dbackground\x3dbrblack
# set -g fish_color_status red
# set -g fish_color_user brgreen
# set -g fish_color_valid_path \x2d\x2dunderline
# set -g fish_key_bindings fish_vi_key_bindings
# set -g fish_pager_color_completion normal
# set -g fish_pager_color_description yellow\x1e\x2di
# set -g fish_pager_color_prefix normal\x1e\x2d\x2dbold\x1e\x2d\x2dunderline
# set -g fish_pager_color_progress brwhite\x1e\x2d\x2dbackground\x3dcyan
# set -g fish_pager_color_selected_background \x2dr
