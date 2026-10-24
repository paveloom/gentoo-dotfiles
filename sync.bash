#!/usr/bin/env bash

PREFIX="/"
ROOT="$(realpath -e "$0" | xargs dirname)"

# Usage: symlink FILE [OPTION]...
#
# Options:
#     -d   Symlink directories under this directory
#     -f   Symlink regular files under this directory
#
# Using either of these options disables the default
# behaviour of symlinking the passed file itself.
symlink() {
    local repo_file="$1"

    local option_symlink_directories=false
    local option_symlink_regular_files=false

    for arg in "$@"; do
        shift
        case "$arg" in
        "-d")
            set -- "$@"
            option_symlink_directories=true
            ;;
        "-f")
            set -- "$@"
            option_symlink_regular_files=true
            ;;
        *) set -- "$@" "$arg" ;;
        esac
    done

    if $option_symlink_directories; then
        symlink_directories "$@"
    fi

    if $option_symlink_regular_files; then
        symlink_regular_files "$@"
    fi

    if $option_symlink_directories || $option_symlink_regular_files; then
        return
    fi

    local target_file="$ROOT/$repo_file"
    local symlink_file="$PREFIX$repo_file"

    if sudo test -e "$symlink_file"; then
        if sudo test -L "$symlink_file"; then
            local current_target_file
            current_target_file="$(sudo readlink "$symlink_file")"

            if [[ "$current_target_file" == "$target_file" ]]; then
                return
            fi

            local file_type
            file_type="$(file -bL "$current_target_file")"

            echo "file $symlink_file is a symbolic link to $current_target_file ($file_type)"
            read -r -p "Override? (y/n): " confirm </dev/tty
            if [[ "$confirm" != "y" ]]; then
                return
            fi
        else
            echo "file $symlink_file already exists; skipping"
            return
        fi
    fi

    if [[ ! -w "$(dirname "$symlink_file")" ]]; then
        sudo ln -fs -T "$target_file" "$symlink_file"
    else
        ln -fs -T "$target_file" "$symlink_file"
    fi

    echo "$symlink_file -> $target_file"
}

symlink_by_type() {
    local top_dir="$1"
    local type="$2"

    while read -r input_file; do
        symlink "$input_file"
    done < <(find -L "$top_dir" -mindepth 1 -maxdepth 1 -type "$type")
}

symlink_directories() {
    local top_dir="$1"
    symlink_by_type "$top_dir" "d"
}

symlink_regular_files() {
    local top_dir="$1"
    symlink_by_type "$top_dir" "f"
}

main() {
    echo "The script will call \`sudo\` whenever root access is necessary."
    sudo -v || exit

    symlink "etc" -f
    symlink "etc/bash"
    symlink "etc/env.d" -f
    symlink "etc/fish"
    symlink "etc/nftables"
    symlink "etc/nginx" -f
    symlink "etc/nginx/conf.d"
    symlink "etc/pam.d" -f
    symlink "etc/portage"
    symlink "etc/ripgrep"
    symlink "etc/scx_loader"
    symlink "etc/speech-dispatcher"
    symlink "etc/systemd/coredump.conf.d/"
    symlink "etc/systemd/journald.conf.d/"
    symlink "etc/systemd/system" -d -f
    symlink "etc/systemd/system.conf.d/"
    symlink "etc/vim"
    symlink "home/paveloom" -f
    symlink "home/paveloom/.config" -f
    symlink "home/paveloom/.config/clangd"
    symlink "home/paveloom/.config/codebook"
    symlink "home/paveloom/.config/cosmic/com.system76.CosmicTerm/v1" -f
    symlink "home/paveloom/.config/emacs"
    symlink "home/paveloom/.config/fish"
    symlink "home/paveloom/.config/fontconfig"
    symlink "home/paveloom/.config/foot"
    symlink "home/paveloom/.config/git"
    symlink "home/paveloom/.config/halloy"
    symlink "home/paveloom/.config/helix"
    symlink "home/paveloom/.config/inputactions"
    symlink "home/paveloom/.config/labwc"
    symlink "home/paveloom/.config/lazygit"
    symlink "home/paveloom/.config/lf"
    symlink "home/paveloom/.config/mpv"
    symlink "home/paveloom/.config/nvim"
    symlink "home/paveloom/.config/sway"
    symlink "home/paveloom/.config/swaylock"
    symlink "home/paveloom/.config/systemd"
    symlink "home/paveloom/.config/tmux"
    symlink "home/paveloom/.config/yambar"
    symlink "home/paveloom/.config/zed"
    symlink "home/paveloom/.gnupg" -f
    symlink "home/paveloom/.local/share/applications" -f
    symlink "home/paveloom/.ssh" -f
    symlink "root/.config" -d
    symlink "usr/share/i18n" -f
    symlink "usr/share/i18n/locales" -f
    symlink "var/lib/plasmalogin/.config" -f
}

main
