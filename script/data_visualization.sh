#!/bin/bash


echo "===================="
echo "build .env file for pgadmin"
echo "===================="
cp .env.pgadmin_config ./data_visualization/pgadmin/.env
source .env.postgres_config
source .env.common.sample
mkdir -p ./data_visualization/pgadmin-server_config
cat <<EOR > ./data_visualization/pgadmin-server_config/servers.json
{
    "Servers": {
        "1": {
            "Name": "${METADATA_POSTGRES_DB}",
            "Group": "Servers",
            "Host": "${DEPLOYMENT_PF_HOST_IP}",
            "Port": "${METADATA_POSTGRES_CONTAINER_PORT}",
            "MaintenanceDB": "${METADATA_POSTGRES_DB}",
            "Username": "${METADATA_POSTGRES_USER}",
            "Password": "${METADATA_POSTGRES_PASSWORD}",
            "SSLMode": "prefer"
        },
        "2": {
            "Name": "${AUTHENTICATE_POSTGRES_DB}",
            "Group": "Servers",
            "Host": "${DEPLOYMENT_PF_HOST_IP}",
            "Port": "${AUTHENTICATE_POSTGRES_CONTAINER_PORT}",
            "MaintenanceDB": "${AUTHENTICATE_POSTGRES_DB}",
            "Username": "${AUTHENTICATE_POSTGRES_USER}",
            "Password": "${AUTHENTICATE_POSTGRES_PASSWORD}",
            "SSLMode": "prefer"
        }
    }
}
EOR

echo "===================="
echo "build container for pgadmin"
echo "===================="

cd ./data_visualization/pgadmin
bash ./run_pgadmin.sh
