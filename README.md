# Docker Compose configuration for Cytomine

## Installation
1. Clone the repository (Repo TBD)
```shell
git clone ....
```

2. Retrieve Cytomine-bootstrap
Cytomine-bootstrap gathers all commands and scripts to manage your SlideVault instance.

To install the latest version of SlideVault, run:
```shell
git clone git@hdp-gitlab.hurondigitalpathology.com:pine/cytomine-bootstrap.git Cytomine_bootstrap
```

3. Configure SlideVault installation

Open the file configuration.sh in a text editor.

### Configure URLs

In order to open SlideVault in your browser, URLs pointing to SlideVault components have to be configured.

* *CORE_URL* is the URL of the main SlideVault server.
* *IMS_URL* is the URL for the image server.
* *UPLOAD_URL* is the URL used to upload new images.

*CORE_URL*, *IMS_URL* and *UPLOAD_URL* have to be different (even if they are pointing to the same host). As an example, cytomine.domain.my and cytomine.domain.my/ims will not work as ims is subURL of the main ones. cytomine.domain.my, cytomine-ims.domain.my, ... is a valid example.

Decide about the accessibility of your installation:

* **To share your installation and make your SlideVault instance accessible** from anywhere, create DNS entries and make their HTTP(S) ports (80/443) accessible for these URLs. This operation can often be realised by your network administrator or your IT department.
* **To install locally (on a laptop for example)**, open the file /etc/hosts in a text editor. Append these lines:

```text
127.0.0.1 $CORE_URL
127.0.0.1 $IMS_URL
127.0.0.1 $UPLOAD_URL
127.0.0.1 rabbitmq
```
where *$CORE_URL*, *$IMS_URL* and *$UPLOAD_URL* have been substituted by the values you chose.

If you have a default configuration you may use next:

```text
127.0.0.1 dev.hurondigitalpathology.com ims.hurondigitalpathology.com ims2.hurondigitalpathology.com upload.hurondigitalpathology.com
```

On Mac OS, run **sudo killall -HUP mDNSResponder** after /etc/hosts update.

### Configure disk paths

All paths referenced in **..._PATH** configuration keys must exist and be mappable in the Docker engine.

### Other configuration

You can learn about the other variables on this dedicated [page](https://doc.cytomine.org/admin-guide/install_variables).

4. Start SlideVault

Generate SSL Certificate and key

```shell
mkdir ../Cytomine_bootstrap/cert && \
openssl req  -subj "/C=CA/CN=*.hurondigitalpathology.com"  -x509 -nodes -days 365  -newkey rsa:2048 -keyout ../Cytomine_bootstrap/cert/wildcard_hurondigitalpathology_com.key -out ../Cytomine_bootstrap/cert/Huron.crt
```

Initialize your SlideVault instance with the configuration you chose at previous step. Run

```shell
bash init.sh
```
Sing in to a Docker repository:

```shell
$(aws ecr get-login  --no-include-email)
```

Change dir to a cytomyne-docker-compose and run a docker compose configuration:

```shell
cd ../cytomine-docker-compose && \
docker-compose -f docker-compose-base.yml  -f docker-compose-ims.yml -f docker-compose-app.yml up 
```

for some debugging purposes, image(s) and container(s) recreation use this command:

```shell
docker-compose -f docker-compose-base.yml  -f docker-compose-ims.yml -f docker-compose-app.yml up --build --force-recreate --no-deps [service_name]
```

if there is no *service_name* all the images and containers will be rebuilt and recreated.

## Additional information

Some additional information redarding Cytomine's installation and configuration is [here](https://doc.cytomine.org/admin-guide/install.html).

