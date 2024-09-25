#!/bin/bash

echo "===================="
echo "build .env.common file for agent_mgt-metadata_mgt"
echo "===================="
cp .env.common.sample ./metadata_resource_mgt/django/metadata_mgt/.env.common

echo "===================="
echo "build .env file for metadata_postgres"
echo "===================="
cp .env.postgres_config ./metadata_resource_mgt/postgres/.env

echo "===================="
echo "build container for agent_mgt-metadata_mgt"
echo "===================="
source ./metadata_resource_mgt/postgres/.env
cd ./metadata_resource_mgt/django/metadata_mgt
cp .env.sample .env
sed -i "/^HTTP_POSTGRES_DATABASE_NAME=/ s/$/$METADATA_POSTGRES_DB/" .env
sed -i "/^HTTP_POSTGRES_PORT=/ s/$/$METADATA_POSTGRES_CONTAINER_PORT/" .env
sed -i "/^HTTP_POSTGRES_USER=/ s/$/$METADATA_POSTGRES_USER/" .env
sed -i "/^HTTP_POSTGRES_PASSWORD=/ s/$/$METADATA_POSTGRES_PASSWORD/" .env
bash ./shell/run_backend.sh

echo "===================="
echo "build container for metadata_postgres"
echo "===================="
cd ../../postgres
bash ./run_metadata_postgres.sh