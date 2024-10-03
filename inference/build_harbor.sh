#!/bin/bash

source ../.env.inference_config
source ../.env.common.sample

# ==================================
# download harbor installer
# ==================================
wget https://github.com/goharbor/harbor/releases/download/v2.8.1/harbor-offline-installer-v2.8.1.tgz
tar xvf harbor-offline-installer-v2.8.1.tgz
cd harbor
cp harbor.yml.tmpl harbor.yml

# ==================================
# set harbor.yml
# ==================================
sed -i "/hostname/s/reg.mydomain.com/$DEPLOYMENT_PF_HOST_IP/" harbor.yml
sed -i "/harbor_admin_password/s/Harbor12345/$HARBOR_USER_PW/" harbor.yml

sed -i '/https:/s/^/# /' harbor.yml
sed -i '/port: 443/s/^/# /' harbor.yml
sed -i '/certificate:/s/^/# /' harbor.yml
sed -i '/private_key:/s/^/# /' harbor.yml

sed -i "/data_volume: /s/\/data/\/harbor_data/" harbor.yml

# ==================================
# set docker daemon
# ==================================
sudo touch /etc/docker/daemon.json
sudo chmod 777 /etc/docker/daemon.json
sudo cat <<EOR > /etc/docker/daemon.json
{
    "insecure-registries" : ["$DEPLOYMENT_PF_HOST_IP:80", "$DEPLOYMENT_PF_HOST_IP"]
}
EOR

sudo cat /etc/docker/daemon.json

# ==================================
# restart docker
# ==================================
sudo systemctl daemon-reload
sudo systemctl restart docker
./prepare
sudo ./install.sh

curl -u "admin:$HARBOR_USER_PW" -X POST "http://$DEPLOYMENT_PF_HOST_IP/api/v2.0/projects" -H "Content-Type: application/json" -d '{"project_name": "inference_host", "public": false}'
curl -u "admin:$HARBOR_USER_PW" -X POST "http://$DEPLOYMENT_PF_HOST_IP/api/v2.0/projects" -H "Content-Type: application/json" -d '{"project_name": "position", "public": false}'
