#!/bin/bash

source .env

docker rm -f ${AUTHENTICATE_POSTGRES_CONTAINER_NAME}

docker run \
    --restart=always \
    --name ${AUTHENTICATE_POSTGRES_CONTAINER_NAME} \
    -p ${AUTHENTICATE_POSTGRES_CONTAINER_PORT}:5432 \
    -v ${AUTHENTICATE_POSTGRES_DB_BACKUP_PATH}:/var/lib/postgresql/data \
    -e POSTGRES_DB=${AUTHENTICATE_POSTGRES_DB} \
    -e POSTGRES_USER=${AUTHENTICATE_POSTGRES_USER} \
    -e POSTGRES_PASSWORD=${AUTHENTICATE_POSTGRES_PASSWORD} \
    -itd postgres:13