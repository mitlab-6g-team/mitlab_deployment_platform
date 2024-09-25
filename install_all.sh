#!/bin/bash

echo "===================="
echo "install basic_package"
echo "===================="
bash ./script/basic_package.sh

echo "===================="
echo "install metadata_resource_mgt"
echo "===================="
bash ./script/metadata_resource_mgt.sh

echo "===================="
echo "install file_resource_mgt"
echo "===================="
bash ./script/file_resource_mgt.sh

echo "===================="
echo "install layer_connector"
echo "===================="
bash ./script/layer_connector.sh

echo "===================="
echo "install permission_mgt"
echo "===================="
bash ./script/permission_mgt.sh

echo "===================="
echo "install data_visualization"
echo "===================="
bash ./script/data_visualization.sh

echo "===================="
echo "install inference"
echo "===================="
bash ./script/inference.sh

echo "===================="
echo "init authenticate_postgresql"
echo "===================="
docker exec -it agent_authenticate_middleware python manage.py generate_real_data --table_name=api  --action=restore