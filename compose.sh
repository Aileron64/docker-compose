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

RED="\e[31m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"


#export DOCKER_BUILDKIT=0
#export COMPOSE_DOCKER_CLI_BUILD=0

if [ ! -e $PWD/configs/software_router/keys/ssh_key ]
then
    echo "ssh keys for software_router must exists !"
    echo "generate them and put them in the $PWD/configs/software_router/keys folder "
    exit 1
fi

ALL_COMPOSER_CONFIGS="-f compose/docker-compose-base.yml -f compose/docker-compose-ims.yml -f compose/docker-compose-app.yml -f compose/docker-compose-hl7.yml"

function login_to_aws() {
    docker login -u AWS -p $(aws ecr get-login-password --region us-east-2) 782111260328.dkr.ecr.us-east-2.amazonaws.com
}

function deploy() {
    login_to_aws

    docker compose -f compose/docker-compose-base.yml -f compose/docker-compose-ims.yml up --build -d
    if false; then
    docker compose -f compose/docker-compose-base.yml -f compose/docker-compose-hl7.yml up --build -d
    fi
    docker compose -f compose/docker-compose-base.yml \
                    -f compose/docker-compose-ims.yml \
                    -f compose/docker-compose-app.yml \
                    -f compose/docker-compose-hl7.yml \
                    up --build -d core
    docker compose -f compose/docker-compose-base.yml \
                    -f compose/docker-compose-ims.yml \
                    -f compose/docker-compose-app.yml \
                    -f compose/docker-compose-hl7.yml \
                    up --build -d nginx
}
case "$1" in
install|update)
echo "Deploying docker compose configuration."
deploy
;;
remove)
echo -e "${RED}Are you sure? ${ENDCOLOR}"
read -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
echo "Removing all containers and volumes."
docker compose $ALL_COMPOSER_CONFIGS down --volumes
fi
;;
clean)
echo "Keeping volumes and removing containers."
docker compose $ALL_COMPOSER_CONFIGS down
;;
start)
echo "Starting docker compose configuration."
docker compose $ALL_COMPOSER_CONFIGS start $2
;;
stop)
echo "Stopping docker compose configuration."
docker compose $ALL_COMPOSER_CONFIGS stop $2
;;
restart)
[ -z $2 ] && echo "${RED}No service name provided!${ENDCOLOR}" && exit 1
echo "Stopping docker compose configuration."
docker compose $ALL_COMPOSER_CONFIGS stop $2
docker compose $ALL_COMPOSER_CONFIGS start $2
;;
shell)
[ -z $2 ] && echo "${RED}No service name provided!${ENDCOLOR}" && exit 1
echo "Stopping docker compose configuration."
docker compose $ALL_COMPOSER_CONFIGS exec -it $2 /bin/sh
;;
scale)
echo -e "${YELLOW}Scaling IMS. ${RED}Experimental feature!.${ENDCOLOR}"
docker compose $ALL_COMPOSER_CONFIGS up --scale ims=$2 -d ims
;;
logs)
echo "See the logs of the deployed servers."
docker compose $ALL_COMPOSER_CONFIGS logs -f $2
;;
status|stat|ps)
# Check to see if the process is running
docker compose $ALL_COMPOSER_CONFIGS ps
;;
*)
echo "SlideVault Service"
echo $"Usage: $0 {install|update|clean|remove|scale|start [container_name]|stop [container_name]|restart [container_name]|shell [container_name]|status|logs [container_name]}"
exit 1
esac
exit 0
