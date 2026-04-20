# Install Docker
Please install Docker on your x86 PC according to different platforms, please refer to docker docs for more Docker installation

Here is an example of installing Docker using Ubuntu.

## Uninstall the old version of Docker

```shell
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

## Configure the docker apt repository
```shell
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```
## Add the repository to Apt sources:

```
echo \
 "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
 $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
 sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

## Install docker
```shell
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

# Install ACUITY
Tips
Due to SDK version compatibility issues, different choices need to be made according to the NPU

## Get the ACUITY download package
```
unzip docker_images_v1.8.x.zip
```
## Load the mirror
```
cd docker_images_v1.8.x
unzip ubuntu-npu_v1.8.11.tar.zip
sudo docker load -i ubuntu-npu_v1.8.11.tar
```
When the docker image is loaded, you can see this image in (A733) or (T527)docker ``imagesubuntu‑npu:v2.0.10.1ubuntu-npu:v1.8.11``

## Create a docker container
```shell
mkdir docker_data && cd docker_data
sudo docker run --ipc=host -itd -v ${PWD}:/workspace --name allwinner_v1.8.11 ubuntu-npu:v1.8.11 /bin/bash
```
When the docker container is created, you can see it in (A733) or (T527)
```shell
docker ps -aallwinner_v2.0.10.1allwinner_v1.8.11
```
## Go into the docker container
Use View Container ID
```shell
docker ps -a
```

```shell
sudo docker exec -it docker_ID /bin/bash
```

---

