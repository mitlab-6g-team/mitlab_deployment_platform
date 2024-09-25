#!/bin/bash


echo "===================="
echo "build .env file for pgadmin"
echo "===================="
cp .env.pgadmin_config ./data_visualization/pgadmin/.env

echo "===================="
echo "build container for pgadmin"
echo "===================="

cd ./data_visualization/pgadmin
bash ./run_pgadmin.sh
