#
# Copyright (c) 2009-2020. Authors: see NOTICE file.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#URLs
CORE_URL=redhat.hurondigitalpathology.com
IMS_URL1=redhat-ims.hurondigitalpathology.com
IMS_URL2=redhat-ims2.hurondigitalpathology.com
UPLOAD_URL=redhat-upload.hurondigitalpathology.com

#Mail
ADMIN_EMAIL='info@cytomine.coop'
# SENDER_EMAIL, SENDER_EMAIL_PASS, SENDER_EMAIL_SMTP : email params of the sending account
SENDER_EMAIL_PASS='passwd'
SENDER_EMAIL_SMTP_HOST='smtp.gmail.com'
SENDER_EMAIL_SMTP_PORT='587'
SENDER_EMAIL='your.email@gmail.com'
# RECEIVER_EMAIL : email adress of the receiver
RECEIVER_EMAIL='receiver@XXX.com'

#Mail
ADMIN_EMAIL='info@cytomine.coop'

#Paths
IMS_STORAGE_PATH=/data/images
IMS_BUFFER_PATH=/data/images/_buffer
UPLOADED_SOFTWARES_PATH=/data/softwares/code

#middlewares
RABBITMQ_USER="slidevault"
RABBITMQ_PASSWORD="slidevault"

#http or https
PROTOCOL="https"
NGINX_CONF="nginx"

SSL_CRT="Huron.crt"
SSL_KEY="wildcard_hurondigitalpathology_com.key"

# You don't have to change the datas below this line instead of advanced customization
# ---------------------------

NB_IIP_PROCESS=10

IIP_OFF_URL=iip-base.hurondigitalpathology.com
IIP_CYTO_URL=iip-cyto.hurondigitalpathology.com
IIP_JP2_URL=iip-jp2000.hurondigitalpathology.com

MEMCACHED_PASS="mypass"

BIOFORMAT_ENABLED=true
BIOFORMAT_ALIAS="bioformat"
BIOFORMAT_PORT="4321"

AWS_ID="782111260328"

CORE_REPO="782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-core:v1.1.12"
WEB_UI_REPO="782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-web_ui:v1.4.0.ui-test"
IMS_REPO="782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-ims:v1.0.3"
IIP_CYTO_REPO="782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-iipcyto:v1.1.0"
RABBITMQ_REPO="782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault/rabbitmq-off:v1.0"

POSTGIS_REPO="782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-postgis:v1.1.2"
MONGODB_REPO="782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-mongodb:v1.0.0"
NGINX_REPO="782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-nginx:v1.1.2"
MEMCACHED_REPO="782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-memcached:v1.1.2"
SOFTWARE_ROUTER_REPO="782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-software_router:v1.2"
BIOFORMAT_REPO="782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-bioformat:v1.0.0"
IIP_OFF_REPO="782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-iipofficial:v1.0.0"
SLURM_REPO="782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-slurm:v1.0.0"

#keys
ADMIN_PWD="huron@123"
ADMIN_PUB_KEY=$(cat /proc/sys/kernel/random/uuid)
ADMIN_PRIV_KEY=$(cat /proc/sys/kernel/random/uuid)
SUPERADMIN_PUB_KEY=$(cat /proc/sys/kernel/random/uuid)
SUPERADMIN_PRIV_KEY=$(cat /proc/sys/kernel/random/uuid)
RABBITMQ_PUB_KEY=$(cat /proc/sys/kernel/random/uuid)
RABBITMQ_PRIV_KEY=$(cat /proc/sys/kernel/random/uuid)
IMS_PUB_KEY=$(cat /proc/sys/kernel/random/uuid)
IMS_PRIV_KEY=$(cat /proc/sys/kernel/random/uuid)
SERVER_ID=$(cat /proc/sys/kernel/random/uuid)

HL7_BRIDGE_DEPLOY=false
HL7_BRIDGE_IMAGE=782111260328.dkr.ecr.us-east-2.amazonaws.com/slidevault-hl7-bridge-msk:latest
# Options: MSK | CoPathPlus
HL7_BRIDGE_CLIENT_VARIANT=MSK
HL7_BRIDGE_SERVER_PORT=8888
HL7_BRIDGE_CLIENT_HOST=140.163.170.109
HL7_BRIDGE_CLIENT_PORT=17240
