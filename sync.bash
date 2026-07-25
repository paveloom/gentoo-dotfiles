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
    local input_file="$1"

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

    if [[ ${input_file:0:1} != / ]]; then
        input_file="$ROOT/$input_file"
    fi

    local output_file
    output_file="$PREFIX$(realpath -s --relative-to "$ROOT" "$input_file")"

    if sudo test -e "$output_file"; then
        if sudo test -L "$output_file"; then
            local target
            target="$(sudo readlink "$output_file")"

            if [[ "$target" == "$input_file" ]]; then
                return
            fi

            local file_type
            file_type="$(file -bL "$target")"

            echo "file $output_file is a symbolic link to $target ($file_type)"
            read -r -p "Override? (y/n): " confirm </dev/tty
            if [[ "$confirm" != "y" ]]; then
                return
            fi
        else
            echo "file $output_file already exists; skipping"
            return
        fi
    fi

    if [[ ! -w "$(dirname "$output_file")" ]]; then
        sudo ln -fs -T "$input_file" "$output_file"
    else
        ln -fs -T "$input_file" "$output_file"
    fi

    echo "$output_file -> $input_file"
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
    symlink "etc/nginx/conf.d"
    symlink "etc/pam.d" -f
    symlink "etc/portage"
    symlink "etc/ripgrep"
    symlink "etc/scx_loader"
    symlink "etc/speech-dispatcher"
    symlink "etc/systemd/system" -d -f
    symlink "etc/systemd/system.conf.d/"
    symlink "etc/vim"
    symlink "home/paveloom" -f
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
    symlink "home/paveloom/.ssh" -f
    symlink "root/.config" -d
    symlink "usr/share/i18n" -f
    symlink "usr/share/i18n/locales" -f
}

main
