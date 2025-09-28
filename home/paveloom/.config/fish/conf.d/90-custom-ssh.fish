if status is-interactive
    # Use the `gpg-agent` for the SSH protocol
    set -e SSH_AGENT_PID
    set -q gnupg_SSH_AUTH_SOCK_by; or set -l gnupg_SSH_AUTH_SOCK_by 0
    if test $gnupg_SSH_AUTH_SOCK_by -ne %self
        gpgconf --launch gpg-agent
        set -x SSH_AUTH_SOCK "$(gpgconf --list-dirs agent-ssh-socket)"
    end
end
