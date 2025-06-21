#!/usr/bin/env bash

# 
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
script_dir_name="$(basename $script_dir)"
logger_file="${script_dir}/docker_image_info.md"
image_name="samples-docker/1.1.dockerfile_hello:v1.0"

###############################################################################

f_logger_tee() {
    # tee-style logging function for command launch actions
    while IFS= read -r data; do
        log_time=$(date +"%Y-%m-%d %T.%3N")
        printf "%s\n" "$data"
        printf "%s\n" "$data" >> "$logger_file"
    done
}

f_logger_code_block_start() {
    # 
    printf "\`\`\`json\n" >> "$logger_file"
}

f_logger_code_block_end() {
    # 
    printf "\`\`\`\n" >> "$logger_file"
}

f_get_info__docker_images() {
    # 
    printf "\n\n## docker images \n" | tee -a "$logger_file"
    f_logger_code_block_start
    docker images "$image_name" | f_logger_tee
    f_logger_code_block_end
}

f_get_info__docker_inspect() {
    # 
    printf "\n\n## docker inspect \n" | f_logger_tee
    f_logger_code_block_start
    docker inspect "$image_name" | f_logger_tee
    f_logger_code_block_end
}

###############################################################################

# Go to the script directory
cd "$script_dir"

# Init title
printf "# docker_image_info \n\n" | tee "$logger_file"
printf "Image name: $image_name \n\n" | f_logger_tee
printf "Date run: $(date) \n" | f_logger_tee

# 
f_get_info__docker_images

# 
f_get_info__docker_inspect
