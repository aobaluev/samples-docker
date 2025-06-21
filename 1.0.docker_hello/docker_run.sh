#!/usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# Go to the script directory
cd "$script_dir"

# Run the container with these options:
# -it
#     Interactive mode with TTY enabled — keeps stdin open and allocates a pseudo-terminal
# --rm
#     Automatically remove the container after it exits to avoid leftover stopped containers
# --name 1.0.docker_hello
#     Assign a custom name to the container for easier management
# debian:latest
#     Specify the image name and tag to run (latest Debian image)
# sh -c 'echo "Hello from image"'
#     Run a shell command inside the container that prints "Hello from image"
docker run -it --rm --name 1.0.docker_hello debian:latest sh -c 'echo "Hello from image"'
