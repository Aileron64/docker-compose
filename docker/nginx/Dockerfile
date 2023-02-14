FROM 782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-nginx:v1.0.0

#Self-signed certificate instalation
ADD cert/Huron.crt /usr/local/share/ca-certificates/Huron.crt
RUN update-ca-certificates

# HTTPS Configuration
ADD cert/Huron.crt /etc/cert/Huron.crt
ADD cert/wildcard_hurondigitalpathology_com.key /etc/cert/wildcard_hurondigitalpathology_com.key
ADD configs/nginx/nginx.conf /usr/local/nginx/conf/nginx.conf
ADD configs/nginx/ssl.conf /usr/local/nginx/conf/ssl.conf
