#!/bin/bash

is_database_ready() {
    if [ $(docker inspect --format='{{.State.Health.Status}}' "postgres" 2>/dev/null) == "healthy" ]; then
        return 0
    else
        return 1
    fi
}

docker login -u AWS -p $(aws ecr get-login-password --region us-east-2) 782111260328.dkr.ecr.us-east-2.amazonaws.com
cd compose
# Run only database to create keycloak schema. 
# Ideally it should be part of postgres container entrypoint but somehow its not working since its custom postgres image. Need to figure that out
docker-compose -f docker-compose-combined.yml up -d postgresql

# Wait until the container is healthy
while ! is_database_ready; do
    echo "Database container is not healthy yet, waiting..."
    sleep 1 
done

# Create keycloak schema if it does not already exists
docker exec  postgres psql "postgresql://docker:docker@localhost:5432/docker" -c "CREATE SCHEMA IF NOT EXISTS keycloak AUTHORIZATION docker;"

# Run all the containers now
SV_HOST_IP="$(dig +short abhishek.hurondigitalpathology.com)" docker-compose -f docker-compose-combined.yml up -d