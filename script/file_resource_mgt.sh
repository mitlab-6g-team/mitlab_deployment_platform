#!/bin/bash

echo "===================="
echo "build .env.common file for agent_mgt-file_mgt"
echo "===================="
cp .env.common.sample ./file_resource_mgt/django/file_mgt/.env.common

echo "===================="
echo "build container for agent_mgt-file_mgt"
echo "===================="
cd ./file_resource_mgt/django/file_mgt
cp .env.sample .env
bash ./shell/run_backend.sh
