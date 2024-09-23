#!/bin/bash

cd ./system_rt_mgt

# ==================================
# init the submodule
# ==================================
git submodule update --init --recursive

# ==================================
# set the env params
# ==================================
cp .env.sample .env
cp ../.env.common .env.common

# ==================================
# build image and run container
# ==================================
python3 -m venv venv
source venv/bin/activate
pip install -r ./requirements/base.txt
tmux new-session -d -s system_rt_mgt 'source venv/bin/activate && python manage.py runserver 0.0.0.0:30303'