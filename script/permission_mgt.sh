#!/bin/bash

echo "===================="
echo "build .env.common file for agent_mgt-authenticate_middleware"
echo "===================="
cp .env.common.sample ./permission_mgt/django/authenticate_middleware/.env.common

echo "===================="
echo "build .env file for authenticate_postgres"
echo "===================="
cp .env.postgres_config ./permission_mgt/postgres/.env

echo "===================="
echo "build container for agent_mgt-authenticate_middleware"
echo "===================="
source ./permission_mgt/postgres/.env
cd ./permission_mgt/django/authenticate_middleware
cp .env.sample .env
sed -i "/^HTTP_POSTGRES_DATABASE_NAME=/ s/$/$AUTHENTICATE_POSTGRES_DB/" .env
sed -i "/^HTTP_POSTGRES_PORT=/ s/$/$AUTHENTICATE_POSTGRES_CONTAINER_PORT/" .env
sed -i "/^HTTP_POSTGRES_USER=/ s/$/$AUTHENTICATE_POSTGRES_USER/" .env
sed -i "/^HTTP_POSTGRES_PASSWORD=/ s/$/$AUTHENTICATE_POSTGRES_PASSWORD/" .env
bash ./shell/run_backend.sh

echo "===================="
echo "build container for authenticate_postgres"
echo "===================="
cd ../../postgres
bash ./run_authenticate_postgres.sh

echo "===================="
echo "init authenticate_postgresql"
echo "===================="
docker exec -it agent_authenticate_middleware python manage.py generate_real_data --table_name=api  --action=restore
