#!/bin/bash

echo "===================="
echo "build .env.common file for agent_mgt-central_mgt and agent_mgt-inference_mgt"
echo "===================="
cp .env.common.sample ./layer_connector/django/central_connector/.env.common
cp .env.common.sample ./layer_connector/django/inference_connector/.env.common

echo "===================="
echo "build container for agent_mgt-central_mgt"
echo "===================="
cd ./layer_connector/django/central_connector
cp .env.sample .env
bash ./shell/run_backend.sh
cd ../../..

echo "===================="
echo "build container for agent_mgt-inference_mgt"
echo "===================="
cd ./layer_connector/django/inference_connector
cp .env.sample .env
bash ./shell/run_backend.sh
