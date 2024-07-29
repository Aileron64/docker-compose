#!/bin/bash

cd compose

docker-compose -f docker-compose-combined.yml stop
docker rm -v nginx
docker rm -v mongodb
docker rm -v postgresql
docker rm -v rabbitmq

docker rm -v slurm-service
docker rm -v iipoff-service
docker rm -v iip_cyto
docker rm -v bioformat-service
docker rm -v ims-service
docker rm -v core-service
docker rm -v software-router-service
#docker rm -v grpc
