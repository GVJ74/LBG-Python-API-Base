#!/bin/bash

# Exit script if any command fails

set -e

# Define Docker image name
DOCKER_ID="gvj74"
DOCKER_IMAGE="lbg-my-python-sh:v1"

cleanup() {

    echo "Cleaning up previous build artifacts..."

    sleep 3

    # Add commands to clean up previous build artifacts

    docker rm -f $(docker ps -aq) || true

    docker rmi -f $(docker images) || true

    echo "Cleanup done."

}

# Function to build the Docker image

build_docker() {

    echo "Building the Docker image..."

    sleep 3

    docker build -t $DOCKER_ID/$DOCKER_IMAGE .

}

# Function to modify the application

modify_app() {

    echo "Modifying the application..."

    sleep 3

   export PORT=5001

    echo "Modifications done. Port is now set to $PORT"

}

# Function to run the Docker container

run_docker() {

    echo "Running Docker container..."

    sleep 3
    docker run -d -p 80:$PORT PORT=$PORT --name lbgContainer  $DOCKER_ID/$DOCKER_IMAGE
 #  docker run -d -p 80:$PORT -e PORT=$PORT --name lbgContainer  $DOCKER_ID/$DOCKER_IMAGE
 #   docker run -d -p 80:8080 --name lbgContainer $DOCKER_USER/lbg-my-python:v1" 
}

# Main script execution

echo "Starting build process..."

sleep 3

cleanup

build_docker

modify_app

build_docker

run_docker

echo "Build process completed successfully."