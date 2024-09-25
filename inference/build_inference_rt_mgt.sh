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
docker push $HOST_IP/position/master_container:latest