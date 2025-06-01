#!/usr/bin/env bash

PREFIX="/"
ROOT="$(realpath -e $0 | xargs dirname)"

symlink_file() {
    local input_file="$1"

    local output_file
    output_file="$PREFIX$(realpath --relative-to $ROOT $input_file)"

    if [[ -e $output_file ]]; then
        if [[ -L $output_file ]]; then
            local target
            target="$(readlink -f $output_file)"

            if [[ "$target" == "$input_file" ]]; then
                return
            fi

            local file_type
            file_type="$(file -bL $target)"

            echo "file $output_file is a symbolic link to $target ($file_type)"
            read -p "Override? (y/n): " confirm </dev/tty
            if [[ "$confirm" != "y" ]]; then
                return
            fi
        else
            echo "file $output_file already exists; skipping"
            return
        fi
    fi

    local target_user
    target_user="$(dirname $output_file | xargs stat -c "%U")"

    if [[ "$target_user" == "root" ]]; then
        sudo ln -fs -T "$input_file" "$output_file"
    else
        ln -fs -T "$input_file" "$output_file"
    fi
}

symlink_dirs() {
    local top_dir="$1"

    while read -r input_dir; do
        symlink_file "$input_dir"
    done < <(find "$top_dir" -mindepth 1 -maxdepth 1 -type d)
}

main() {
    echo "The script will call \`sudo\` whenever root access is necessary."

    for home_dir in "$ROOT/home"/*; do
        symlink_dirs "$home_dir/.config"
    done

    symlink_dirs "$ROOT/etc"
}

main
