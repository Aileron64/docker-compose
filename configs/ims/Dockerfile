FROM 782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-ims:v1.0.3

ADD configs/ims/ims-server.xml /usr/local/tomcat/conf/server.xml
ADD configs/ims/ims-config.groovy /usr/local/tomcat/.grails/ims-config.groovy
# For old images that run behalf on root account
ADD configs/ims/ims-config.groovy /root/.grails/ims-config.groovy
ADD hosts/ims/addHosts.sh /tmp/addHosts.sh

#Self-signed certificate instalation
ADD cert/Huron.crt /usr/local/share/ca-certificates/Huron.crt
RUN update-ca-certificates

COPY cert/Huron.crt $JAVA_HOME/lib/security/Huron.crt
RUN \
    cd $JAVA_HOME/lib/security \
    && keytool -keystore cacerts -storepass changeit -noprompt -trustcacerts -importcert -alias ldapcert -file Huron.crt
