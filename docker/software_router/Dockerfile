FROM 782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-software_router:v1.0.0

ADD hosts/software_router/addHosts.sh /tmp/addHosts.sh
ADD configs/software_router/config.groovy /software_router/config.groovy

ADD configs/software_router/keys/ssh_key /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa