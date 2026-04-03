# See conf.d/ for all configuration
starship init fish | source

# --- Zellij-tmux-shim (Claude Code agent teams in zellij) ---
if set -q ZELLIJ
    set -l _shim (string replace -r '' '' -- "$XDG_DATA_HOME")
    if test -z "$_shim"
        set _shim "$HOME/.local/share"
    end
    set _shim "$_shim/zellij-tmux-shim/activate.sh"
    if test -f "$_shim"
        bass source "$_shim"
    end
end
