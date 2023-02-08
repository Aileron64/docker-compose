FROM cytomine/software_router:v2.1.1

ADD hosts/software_router/addHosts.sh /tmp/addHosts.sh
ADD configs/software_router/config.groovy /software_router/config.groovy

ADD configs/software_router/keys/ssh_key /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa