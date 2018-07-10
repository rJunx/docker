#!/usr/bin/env bash

echo "Start docker..."

IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
DOCKER_SERVER=dev-ubuntu

docker rm dev-server
docker run -it -p 8080:8080 --env-file ../env.jdk8 -e DISPLAY=$IP:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/Docker/opt:/opt -v $HOME/Workspace/Uber:/home/developer --name dev-server $DOCKER_SERVER