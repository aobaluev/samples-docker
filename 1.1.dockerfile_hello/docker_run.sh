#!/usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# Go to the script directory
cd "$script_dir"

# Run the container with the following options:
# -it        Interactive mode with TTY enabled — keeps stdin open and allocates a pseudo-terminal
# --rm       Automatically remove the container after it exits to avoid leftover stopped containers
# --name     (optional) Assign a custom name to the container for easier reference and management
# samples-docker/1.1.dockerfile_hello:v1.0
#            Specify the image name and version tag to ensure a consistent and reproducible run
docker run -it --rm samples-docker/1.1.dockerfile_hello:v1.0
