FROM 782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-core:v1.1.4

ADD configs/core/setenv.sh /tmp/setenv.sh
ADD configs/core/cytomineconfig.groovy /usr/share/tomcat9/.grails/cytomineconfig.groovy
ADD hosts/core/addHosts.sh /tmp/addHosts.sh
ADD configs/core/server.xml /usr/local/tomcat/conf/server.xml

#Self-signed certificate instalation
ADD cert/Huron.crt /usr/local/share/ca-certificates/Huron.crt
RUN update-ca-certificates
