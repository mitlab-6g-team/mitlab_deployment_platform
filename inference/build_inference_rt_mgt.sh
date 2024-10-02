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

sed -i "s/^DEPLOYMENT_PF_HOST_IP=.*/&$DEPLOYMENT_PF_HOST_IP/" ".env.common"
sed -i "s/^EDGE_SERVER_HOST_IP=.*/&$EDGE_SERVER_IP/" ".env.common"
sed -i "s/^INFERENCE_CONNECTOR_CONTAINER_PORT=.*/&$EDGE_SERVER_IP/" ".env.common"
sed -i "s/^INFERENCE_CONNECTOR_API_VERSION=.*/&$EDGE_SERVER_IP/" ".env.common"

# ==================================
# build image and run container
# ==================================
docker build -t $DEPLOYMENT_PF_HOST_IP/position/master_container:latest .
sudo chmod 777 $HOME/.docker
docker login $DEPLOYMENT_PF_HOST_IP -u admin -p $HARBOR_USER_PW
docker push $DEPLOYMENT_PF_HOST_IP/position/master_container:latest