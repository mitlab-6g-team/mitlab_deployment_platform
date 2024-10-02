#!/bin/bash

source .env.inference_config
source .env.common.sample

cd ./inference
# ==================================
# install harbor
# ==================================
echo ==================================
echo install harbor
echo ==================================
bash ./build_harbor.sh

# ==================================
# build and run inference_rt_mgt container
# ==================================
echo ==================================
echo build and run inference_rt_mgt container
echo ==================================
bash ./build_inference_rt_mgt.sh

# ==================================
# run system_rt_mgt
# ==================================
echo ==================================
echo run system_rt_mgt
echo ==================================
bash ./run_system_rt_mgt.sh

