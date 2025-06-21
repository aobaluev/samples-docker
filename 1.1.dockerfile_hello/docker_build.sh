#!/usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# Go to the script directory
cd "$script_dir"

# Build the Docker image with the following options:
# -t samples-docker/1.1.dockerfile_hello:v1.0
#     Tag the built image with a meaningful name and explicit version tag
# . 
#     Use the current directory as the build context (Dockerfile and all files inside)
docker build -t samples-docker/1.1.dockerfile_hello:v1.0 .
