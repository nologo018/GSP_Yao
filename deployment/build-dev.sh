#!bin/bash

NAME="manage-project-data"
docker build -f ./deployment/Dockerfile-dev -t $NAME:dev .