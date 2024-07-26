# Running the application
1. Set domain name and docker image versions in .env file present under compose folder
2. Copy certificate as certificate.crt and key as key.key inside configs/nginx/cert structure
2. Run ./init.sh from root folder
3. Run ./start_deploy.sh


# Troubleshooting & Investigations:
    Gateway startup: If application is not getting up, most likely is due to gateway. Gateway needs access to keycloak and the call goes from outside container network to host. Sometimes the host machine does not allow the call from container to host. If ufw is installed, a rule can be configured to let container access host. Below are some steps:

    a. Check system logs and there should be a ufw block appearing if gateway is failing
        sudo tail -f /var/log/syslog

    b. Capture the network ip from slidevault docker network (say 172.27.0.0) and run below command 
        sudo ufw allow from 172.27.0.0/16 to any port 443 proto tcp comment 'HTTPS'

    c. Restart ufw
        sudo ufw reload && sudo ufw restart

    d. Stop the application and start again (restart might not work)

# Improvements:
    1. If you run docker compose down (instead of stop) to clean the containers, it removes the docker network as well. Removing docker network will cause new ip to be used by slidevault network on next start. This will lead to same issue reported above under investigation section. To mitigate this we can assign static ip to our slidevault network in compose file
    2. Gateway healthcheck is not working. When we would run it inside K8 cluster, healthcheck becomes critical. Its quite strarightforward to make it working
