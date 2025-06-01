#!/usr/bin/env bash

PREFIX="/"
ROOT="$(realpath -e $0 | xargs dirname)"

process_home_config_file() {
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

    ln -fs -T "$input_file" "$output_file"
}

process_home_config() {
    local home_config="$1"

    while read -r input_file; do
        process_home_config_file "$input_file"
    done < <(find $home_config -mindepth 1 -type d)
}

process_home() {
    local home="$1"

    process_home_config "$home/.config"
}

process() {
    for home in "$ROOT/home"/*; do
        process_home "$home"
    done
}

process
