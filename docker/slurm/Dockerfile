FROM cytomine/slurm:v1.2.0

ADD --chown=cytomine:cytomine configs/software_router/keys/ssh_key.pub /home/cytomine/.ssh/authorized_keys
RUN chmod 600 /home/cytomine/.ssh/authorized_keys

ADD hosts/slurm/addHosts.sh /tmp/addHosts.sh
