#!/bin/bash

sudo apt-get update

sudo apt-get install vim nano git curl tmux htop net-tools apt-transport-https ca-certificates -y

sudo apt-get install docker.io=20.10.21-0ubuntu1~20.04.2 -y
sudo chmod 777 /var/run/docker.sock

git submodule update --init --recursive