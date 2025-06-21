#!/usr/bin/env bash

# Generate a Markdown log file with Docker image and container info
# Logs include basic metadata, `docker images`, and `docker inspect` output
# arg1 - optional image name (default: samples-docker/<current_dir_name>:v1.0)

###############################################################################
# Variables

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
script_dir_name="$(basename $script_dir)"
logger_file="${script_dir}/docker_image_info.md"

# Use image name from first script argument if given, otherwise default to directory-based name
if [[ -n "$1" ]]; then
    image_name="$1"
else
    image_name="samples-docker/${script_dir_name}:v1.0"
fi

###############################################################################
# Functions

f_logger_tee() {
    # tee-style logging function for command launch actions
    while IFS= read -r data; do
        log_time=$(date +"%Y-%m-%d %T.%3N")
        printf "%s\n" "$data"
        printf "%s\n" "$data" >> "$logger_file"
    done
}

f_logger_code_block_start() {
    # Start of a code block in a Markdown log file with info about the image and container
    # arg1 - format name (e.g., "bash", "json", "python")
    local _block_format_name="$1"
    printf "\`\`\`${_block_format_name}\n" >> "$logger_file"
}

f_logger_code_block_end() {
    # End of a code block in a Markdown file with info about the image and container
    printf "\`\`\`\n" >> "$logger_file"
}

f_get_info__docker_images() {
    # Write docker images info to Markdown log file
    # Uses $image_name and logs output in a code block
    printf "\n\n## docker images \n" | tee -a "$logger_file"
    f_logger_code_block_start
    docker images "$image_name" | f_logger_tee
    f_logger_code_block_end
}

f_get_info__docker_inspect() {
    # Write docker inspect info to Markdown log file
    # Uses $image_name and logs JSON output in a code block
    printf "\n\n## docker inspect \n" | f_logger_tee
    f_logger_code_block_start "json"
    docker inspect "$image_name" | f_logger_tee
    f_logger_code_block_end
}

###############################################################################
# Script Steps

# Go to the script directory
cd "$script_dir"

# Write initial title and metadata to Markdown log file
printf "# docker_image_info \n\n" | tee "$logger_file"
printf "Image name: $image_name \n\n" | f_logger_tee
printf "Date run: $(date) \n" | f_logger_tee

# 
f_get_info__docker_images

# 
f_get_info__docker_inspect
