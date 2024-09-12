#!/usr/bin/env bash

npm install -g @devcontainers/cli

pipx install shfmt-py

# Check if the explainshell container is running
if [ "$(docker ps -q -f name=explainshell)" ]; then
    # Stop the running container
    docker stop explainshell
    # Remove the container
    docker rm explainshell
fi

# Run a new explainshell container
# this will add hover annotations in shell script files, assuming mads-hartmann.bash-ide-vscod is installed
docker container run --name explainshell --restart always -p 5000:5000 -d spaceinvaderone/explainshell
