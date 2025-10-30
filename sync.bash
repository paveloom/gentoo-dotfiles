#!/usr/bin/env bash

PREFIX="/"
ROOT="$(realpath -e "$0" | xargs dirname)"

symlink_file() {
    local input_file="$1"

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
        symlink_file "$input_file"
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

    symlink_directories "$ROOT/etc"
    symlink_directories "$ROOT/root/.config"

    symlink_regular_files "$ROOT/home/paveloom"
    symlink_directories "$ROOT/home/paveloom/.config"
}

main
