#!/bin/bash

#
# Copyright (c) 2009-2020. Authors: see NOTICE file.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

docker login -u AWS -p $(aws ecr get-login-password --region us-east-2) 782111260328.dkr.ecr.us-east-2.amazonaws.com

docker create --name memcached \
--restart=unless-stopped \
782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-memcached:v1.1.2 > /dev/null

docker cp $PWD/configs/memcached/memcached.conf memcached:/etc/memcached.conf
docker start memcached


docker create --name rabbitmq \
-p 5672:5672 -p 15672:15672 \
-e RABBITMQ_USER=slidevault \
-e RABBITMQ_PASSWORD=slidevault \
--restart=unless-stopped \
782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault/rabbitmq-off:v1.0 > /dev/null

docker start rabbitmq

docker volume create --name postgis_data > /dev/null
# create database docker
docker run -d -m 8g --name postgresql -v postgis_data:/var/lib/postgresql \
-p 5432:5432 \
--restart=unless-stopped \
782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-postgis:v1.1.2 > /dev/null

docker volume create --name mongodb_data > /dev/null
# create mongodb docker
docker run -d --name mongodb -v mongodb_data:/data/db \
-p 27017:27017 -p 28017:28017 \
--restart=unless-stopped \
782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-mongodb:v1.0.0 > /dev/null


if [ ! -e $PWD/configs/software_router/keys/ssh_key ]
then
    echo "ssh keys for software_router must exists !"
    echo "generate them and put them in the $PWD/configs/software_router/keys folder "
    exit 1
fi


docker volume create --name slurm_data > /dev/null
# create slurm docker
docker create --name slurm \
--privileged \
-h cytomine-slurm \
-v slurm_data:/var/lib/mysql \
-v singularity_images:/data/softwares/images \
-v /etc/localtime:/etc/localtime \
--restart=unless-stopped \
782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-slurm:v1.0.0 > /dev/null

docker cp $PWD/configs/software_router/keys/ssh_key.pub slurm:/home/cytomine/.ssh/authorized_keys
docker cp $PWD/configs/slurm/TCGA_Permanent.csv slurm:/tmp/TCGA_Permanent.csv
docker cp $PWD/hosts/slurm/addHosts.sh slurm:/tmp/addHosts.sh
docker start slurm
docker exec -it slurm chown cytomine:cytomine /home/cytomine/.ssh/authorized_keys
docker exec -it slurm chmod 600 /home/cytomine/.ssh/authorized_keys


docker create --name iipOff \
--link memcached:memcached \
-v /data/images:/data/images \
--privileged -e NB_IIP_PROCESS=10 \
--restart=unless-stopped \
782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-iipofficial:v1.0.0 > /dev/null

docker cp $PWD/configs/iipOff/nginx.conf.sample iipOff:/tmp/nginx.conf.sample
docker start iipOff


docker create --name iipCyto \
--link memcached:memcached \
-v /data/images:/data/images \
--privileged -e NB_IIP_PROCESS=10 \
--restart=unless-stopped \
782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-iipcyto:v1.1.0 > /dev/null

docker cp $PWD/configs/iipCyto/nginx.conf.sample iipCyto:/tmp/nginx.conf.sample
docker start iipCyto


docker create --name bioformat \
-v /data/images:/data/images \
-e BIOFORMAT_PORT=4321 \
--restart=unless-stopped \
782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-bioformat:v1.0.0 > /dev/null

docker start bioformat

docker create --name ims \
--link bioformat:bioformat \
-e IMS_STORAGE_PATH=/data/images \
-v /data/images:/data/images \
-v /data/images/_buffer:/tmp/uploaded \
--restart=unless-stopped \
782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-ims:v1.0.3 > /dev/null

docker cp $PWD/configs/ims/ims-server.xml ims:/usr/local/tomcat/conf/server.xml
docker cp $PWD/configs/ims/ims-config.groovy ims:/usr/share/tomcat9/.grails/ims-config.groovy
docker cp $PWD/hosts/ims/addHosts.sh ims:/tmp/addHosts.sh
docker start ims


if false; then

docker pull 782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-hl7-bridge-msk:latest

docker stop hl7-bridge
docker container rm hl7-bridge

docker create --name hl7-bridge \
        -e DB_HOST=postgresql \
        -e HL7_SERVER_PORT=8888 \
        -e HL7_EPIC_HOST=140.163.170.109 \
        -e HL7_EPIC_PORT=17240 \
        -e HL7_EPIC_USE_TLS=false \
        -e SLIDEVAULT_UI_URL=https://redhat.hurondigitalpathology.com/ \
        --link postgresql:postgresql \
        -v /etc/localtime:/etc/localtime \
        --restart=unless-stopped \
        -p 8888:8888 \
        -p 8081:8081 \
        782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-hl7-bridge-msk:latest > /dev/null

docker start hl7-bridge

fi


docker create --name core \
--link postgresql:postgresql \
--link mongodb:mongodb \
--link rabbitmq:rabbitmq \
-v /etc/localtime:/etc/localtime \
-v /data/softwares/code:/data/softwares/code \
--restart=unless-stopped \
782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-core:v1.1.12 > /dev/null

docker cp $PWD/configs/core/setenv.sh core:/tmp/setenv.sh
docker cp $PWD/configs/core/cytomineconfig.groovy core:/usr/share/tomcat9/.grails/cytomineconfig.groovy
docker cp $PWD/hosts/core/addHosts.sh core:/tmp/addHosts.sh
docker cp $PWD/configs/core/server.xml core:/usr/local/tomcat/conf/server.xml
docker start core

docker create --name web_UI \
-v /etc/localtime:/etc/localtime \
--restart=unless-stopped \
782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-web_ui:v1.4.0.ui-test > /dev/null

docker cp "${PWD}/configs/web_ui/configuration.json" web_UI:/app/configuration.json
docker cp "${PWD}/configs/web_ui/nginx.conf" web_UI:/etc/nginx/nginx.conf
docker start web_UI

docker create --name nginx \
--link ims:ims \
--link iipCyto:iipCyto \
--link core:core \
--link iipOff:iipOff \
--link web_UI:web_UI \
-v /data/images/_buffer:/tmp/uploaded \
-v /etc/cert:/etc/cert \
-p 80:80 -p 443:443 \
--restart=unless-stopped \
782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-nginx:v1.1.2 > /dev/null

docker cp $PWD/cert/Huron.crt nginx:/etc/cert/Huron.crt
docker cp $PWD/cert/wildcard_hurondigitalpathology_com.key nginx:/etc/cert/wildcard_hurondigitalpathology_com.key
docker cp $PWD/configs/nginx/nginx.conf nginx:/usr/local/nginx/conf/nginx.conf
docker cp $PWD/configs/nginx/ssl.conf nginx:/usr/local/nginx/conf/ssl.conf
docker start nginx

docker create --name software_router \
-v singularity_images:/data/softwares/images \
-v /var/run/docker.sock:/var/run/docker.sock \
--privileged \
--link rabbitmq:rabbitmq \
--link slurm:slurm \
--restart=unless-stopped \
782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-software_router:v1.2 > /dev/null

docker cp $PWD/hosts/software_router/addHosts.sh software_router:/tmp/addHosts.sh
docker cp $PWD/configs/software_router/config.groovy software_router:/software_router/config.groovy
docker cp $PWD/configs/software_router/keys/ssh_key software_router:/root/.ssh/id_rsa
docker start software_router
docker exec -it software_router chmod 600 /root/.ssh/id_rsa
