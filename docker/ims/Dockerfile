FROM 782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-ims:v1.1.4

ADD configs/ims/ims-server.xml /usr/local/tomcat/conf/server.xml
ADD configs/ims/ims-config.groovy /usr/share/tomcat9/.grails/ims-config.groovy
ADD hosts/ims/addHosts.sh /tmp/addHosts.sh

#Self-signed certificate instalation
ADD cert/Huron.crt /usr/local/share/ca-certificates/Huron.crt
RUN update-ca-certificates
