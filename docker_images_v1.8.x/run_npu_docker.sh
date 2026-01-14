#!/bin/bash

export USER_CONTAINER_NAME=npu_v1.8.11_${USER}
cnt=`sudo docker ps -a|grep "$USER_CONTAINER_NAME"|wc -l`
echo $cnt
echo $USER_CONTAINER_NAME
if [ 0 -eq $cnt ]; then

    DOCKER_DATA_DIR=/home/${USER}/docker_data
    if [[ ! -d "${DOCKER_DATA_DIR}" ]]; then
      mkdir -p ${DOCKER_DATA_DIR}
    fi

    sudo docker run --ipc=host -itd -itd -v /home/${USER}/docker_data:/workspace --name $USER_CONTAINER_NAME   ubuntu-npu:v1.8.11 /bin/bash
    
    sudo docker exec -it $USER_CONTAINER_NAME /bin/bash
else
    sudo docker exec -it $USER_CONTAINER_NAME /bin/bash
fi
