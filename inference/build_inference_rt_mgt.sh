#!/bin/bash

cd ./inference_rt_mgt

# ==================================
# init the submodule
# ==================================
git submodule update --init --recursive

# ==================================
# set the env params
# ==================================
cp .env.sample .env
cp .env.common.sample .env.common

# ==================================
# build image and run container
# ==================================
docker build -t $HOST_IP/position/master_container:latest .
sudo chmod 777 $HOME/.docker
docker login $HOST_IP -u admin -p $HARBOR_USER_PW
docker push $HOST_IP/position/master_container:latest