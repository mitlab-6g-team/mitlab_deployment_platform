#!/bin/bash

cd ./agent_dashboard
cp ../.env.common.sample .env.common
# ==================================
# install harbor
# ==================================
echo ==================================
echo start dashboard container
echo ==================================
bash ./run_production.sh
