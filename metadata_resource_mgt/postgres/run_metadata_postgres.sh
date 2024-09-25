#!/bin/bash

source .env

docker rm -f ${METADATA_POSTGRES_CONTAINER_NAME}

docker run \
    --restart=always \
    --name ${METADATA_POSTGRES_CONTAINER_NAME} \
    -p ${METADATA_POSTGRES_CONTAINER_PORT}:5432 \
    -v ${METADATA_POSTGRES_DB_BACKUP_PATH}:/var/lib/postgresql/data \
    -e POSTGRES_DB=${METADATA_POSTGRES_DB} \
    -e POSTGRES_USER=${METADATA_POSTGRES_USER} \
    -e POSTGRES_PASSWORD=${METADATA_POSTGRES_PASSWORD} \
    -itd postgres:13