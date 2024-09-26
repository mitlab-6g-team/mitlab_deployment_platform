#!/bin/bash

sudo apt-get update

sudo apt-get install vim nano git curl tmux htop net-tools apt-transport-https ca-certificates -y
sudo apt-get install python3.8 python3.8-dev python3.8-distutils python3.8-venv libpython3.8-dev libpq-dev python3-pip -y

sudo apt-get install docker.io=20.10.21-0ubuntu1~20.04.2 -y
sudo chmod 777 /var/run/docker.sock
sudo usermod -aG docker $USER

export DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
source ~/.bashrc
sudo mkdir -p $DOCKER_CONFIG/cli-plugins
sudo curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
sudo chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
sudo mkdir -p /usr/local/lib/docker/cli-plugins
sudo cp $DOCKER_CONFIG/cli-plugins/docker-compose /usr/local/lib/docker/cli-plugins/docker-compose

mkdir ~/inference_host
git submodule update --init --recursive