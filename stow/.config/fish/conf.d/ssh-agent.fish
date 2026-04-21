# Relay 1Password SSH agent (Windows named pipe → WSL Unix socket)
set -gx SSH_AUTH_SOCK $HOME/.ssh/agent.sock

# Restart relay if socket is missing or the socat process has died
if not test -S $SSH_AUTH_SOCK; or not ssh-add -l >/dev/null 2>&1
    rm -f $SSH_AUTH_SOCK
    setsid nohup socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork >/dev/null 2>&1 &
end
