#------------------------------------------------------------------------------
# Zellij
#------------------------------------------------------------------------------
if status is-interactive; and set -q ZELLIJ; and not set -q ZELLIJ_TMUX_SHIM_ACTIVE
    # Claude Code Agent Teams — native fish activation
    # Translates Claude's tmux calls into Zellij pane actions
    set -l shim_dir (set -q XDG_DATA_HOME; and echo $XDG_DATA_HOME; or echo $HOME/.local/share)/zellij-tmux-shim

    if test -d $shim_dir/bin
        # Save real tmux path BEFORE shadowing it on PATH
        set -l real_tmux (command -s tmux 2>/dev/null; or echo "")
        set -gx ZELLIJ_TMUX_SHIM_REAL_TMUX "$real_tmux"
        set -gx ZELLIJ_TMUX_SHIM_ORIG_PATH "$PATH"

        # Shim directory and PATH
        set -gx ZELLIJ_TMUX_SHIM_DIR $shim_dir
        fish_add_path --prepend $shim_dir/bin

        # Fake tmux env so Claude thinks tmux is available
        set -gx TMUX "zellij-shim:/tmp/zellij-shim,$fish_pid,0"
        set -gx TMUX_PANE "%0"
        set -gx ZELLIJ_TMUX_SHIM_ACTIVE 1

        # State directory (per-session, per-user)
        set -l runtime (set -q XDG_RUNTIME_DIR; and echo $XDG_RUNTIME_DIR; or echo $TMPDIR)
        set -l shim_root "$runtime/zellij-tmux-shim-"(id -u)
        set -l state_dir "$shim_root/$ZELLIJ_SESSION_NAME"
        set -gx ZELLIJ_TMUX_SHIM_STATE $state_dir

        if not test -d $state_dir
            mkdir -p $state_dir
            chmod 700 $shim_root
        end

        # Initialize pane ID counter (0 = host, agents start at 1)
        if not test -f $state_dir/next_id
            echo 1 > $state_dir/next_id
        end

        # Initialize sessions file
        if not test -f $state_dir/sessions
            touch $state_dir/sessions
        end

        # Sweep stale PIDs from prior crashed sessions
        for pidfile in $state_dir/*.pid
            set -l pid (cat $pidfile 2>/dev/null)
            if test -n "$pid"; and not kill -0 $pid 2>/dev/null
                set -l base (string replace '.pid' '' (basename $pidfile))
                rm -f $state_dir/$base.pid $state_dir/$base.zellij_id \
                      $state_dir/$base.fifo $state_dir/$base.ready \
                      $state_dir/$base.named $state_dir/$base.group
            end
        end

        # Clean stale env snapshots and locks
        rm -f $state_dir/parent.env 2>/dev/null
        rm -rf $state_dir/next_id.lock 2>/dev/null
    end
end
