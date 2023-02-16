FROM 782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-slurm:v1.1

ADD --chown=cytomine:cytomine configs/software_router/keys/ssh_key.pub /home/cytomine/.ssh/authorized_keys
RUN chmod 600 /home/cytomine/.ssh/authorized_keys

ADD --chown=cytomine:cytomine configs/slurm/TCGA_Permanent.csv /tmp/TCGA_Permanent.csv
ADD --chown=cytomine:cytomine hosts/slurm/addHosts.sh /tmp/addHosts.sh
