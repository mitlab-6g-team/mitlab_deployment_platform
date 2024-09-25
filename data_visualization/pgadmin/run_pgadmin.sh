#!/bin/bash

source .env

docker rm -f ${PGADMIN_CONTAINER_NAME}

docker run \
    --restart=always \
    --name ${PGADMIN_CONTAINER_NAME} \
    -p ${PGADMIN_CONTAINER_PORT}:80 \
    -v $PWD/../pgadmin-server_config/servers.json:/pgadmin4/servers.json \
    -e PGADMIN_SERVER_JSON_FILE=/pgadmin4/servers.json \
    -e PGADMIN_DEFAULT_EMAIL=${PGADMIN_DEFAULT_EMAIL} \
    -e PGADMIN_DEFAULT_PASSWORD=${PGADMIN_DEFAULT_PASSWORD}\
    -d dpage/pgadmin4