if status is-interactive
    # Set up Git prompt
    set __fish_git_prompt_showupstream "informative"
    set __fish_git_prompt_char_stateseparator ""

    # Use the `gpg-agent` for the SSH protocol
    set -e SSH_AGENT_PID
    set -q gnupg_SSH_AUTH_SOCK_by; or set -l gnupg_SSH_AUTH_SOCK_by 0
    if test $gnupg_SSH_AUTH_SOCK_by -ne %self
        gpgconf --launch gpg-agent
        set -x SSH_AUTH_SOCK "$(gpgconf --list-dirs agent-ssh-socket)"
    end

    # Prefer the Rust toolchain from `rustup`
    fish_add_path $HOME/.cargo/bin

    # Add compiled Go packages to the `PATH`
    fish_add_path $HOME/go/bin

    # Enable `direnv` integration
    direnv hook fish | source
end
