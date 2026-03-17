#------------------------------------------------------------------------------
# Zellij
#------------------------------------------------------------------------------
if status is-interactive
    # Auto-attach to zellij session on shell start
    if set -q ZELLIJ
        # Claude Code Agent Teams tmux shim
        # Prepend shim bin to PATH so Claude finds fake tmux
        set -l shim_dir (set -q XDG_DATA_HOME && echo $XDG_DATA_HOME || echo $HOME/.local/share)/zellij-tmux-shim
        if test -d $shim_dir/bin
            fish_add_path --prepend $shim_dir/bin
        end
    end
end
