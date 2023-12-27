#!bin/bash

NAME="manage-project-data"
docker build -f ./deployment/Dockerfile-sit -t $NAME:sit .