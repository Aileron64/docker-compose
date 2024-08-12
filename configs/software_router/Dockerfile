FROM 782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-software_router:v1.2

# ADD hosts/software_router/addHosts.sh /tmp/addHosts.sh
ADD configs/software_router/config.groovy /software_router/config.groovy
ADD configs/software_router/log4j.properties /software_router/log4j.properties

ADD configs/software_router/keys/ssh_key /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

#Self-signed certificate instalation
# ADD cert/Huron.crt /usr/local/share/ca-certificates/Huron.crt
# RUN update-ca-certificates


# COPY cert/Huron.crt $JAVA_HOME/lib/security/Huron.crt
# RUN keytool -keystore "$JAVA_HOME/lib/security/cacerts" -storepass changeit -noprompt -trustcacerts -importcert -file $JAVA_HOME/lib/security/Huron.crt
 
