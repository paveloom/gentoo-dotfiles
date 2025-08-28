# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
    # Shell is non-interactive.  Be done now!
    return
fi

# Put your fun stuff here.

# Use the `gpg-agent` for the SSH protocol
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    gpgconf --launch gpg-agent
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# Prefer the Rust toolchain from `rustup`
export PATH="${HOME}/.cargo/bin:${PATH}"

# Add compiled Go packages to the `PATH`
export PATH="${HOME}/go/bin:${PATH}"

# Enable `direnv` integration
eval "$(direnv hook bash)"
