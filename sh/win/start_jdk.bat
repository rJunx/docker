#!/usr/bin/env bash

echo "Start docker..."

docker rm dev-server
docker run -it -p 8080:8080 --env-file ../env.jdk8 -e DISPLAY=192.168.1.12:0.0 -v D:/workspace/docker/opt:/opt -v D:/workspace/projects/uber:/home/developer --name dev-server dev-ubuntu