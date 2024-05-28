# CYTOMINE DOCKER DEPLOYMENT #

This is the starting point to install Cytomine.
The Dockerfiles are into [this repository](https://github.com/cytomine/Dockerfiles)

## How to install it

- Fill the configuration.sh file

```shell
# Names of the main services.
CORE_URL=dev.hurondigitalpathology.com
IMS_URL1=ims.hurondigitalpathology.com
IMS_URL2=ims2.hurondigitalpathology.com
UPLOAD_URL=upload.hurondigitalpathology.com
```
- If you use SSL/TLS
####  Make a cert dir and add your SSL/TLS certificate and key

```shell
mkdir "cert"
```
#### Change configuration.sh params  
Replace certificate.crt and certificate.key with your filenames
from cert dir. Use filename only.

```shell
PROTOCOL="https"

# SSL/TLS certificate and key for this domain.
SSL_CRT="certificate.crt"
SSL_KEY="certificate.key"
```

- Run the init.sh script
```shell
init.sh
```
- Run the generated start_deploy.sh script
```shell
start_deploy.sh
```

For more information, see our [installation instructions](https://doc.cytomine.org/admin-guide/install)

## Docker Compose

```shell
SlideVault Service
Usage: ./compose.sh {install|update|clean|remove|scale|start|stop|status|logs}
```

### Install or update containers

For a while both of commands do the same
```shell
./compose.sh install
```
```shell
./compose.sh update
```

### Remove
**clean** - removes containers but keeps volumes.
```shell
./compose.sh clean
```

**remove** - removes all the containers and volumes.
```shell
./compose.sh remove
```

### Start/stop
**start** - starts stopped containers.
```shell
./compose.sh start
```

**stop** - stops all the containers.
```shell
./compose.sh stop
```

### Scale
**TBD**

### Maintenance
**logs** - Shows logs for all the containers.
```shell
./compose.sh logs
```

**ps** - Shows statuses of all the containers.
```shell
./compose.sh ps
```


## Remarks

When using our software, we kindly ask you to show our website URL and our logo in all your work (web site, publications, studies, oral presentations, manuals, ...). If you use Cytomine for scientific purpose, please cite Marée et al., Bioinformatics 2016 as reference paper. See our license files for additional details.
- URL: http://www.cytomine.org/
- Logo: [Available here](https://doc.cytomine.org/images/cytomine-org-logo.png)
- Scientific paper: Raphaël Marée, Loïc Rollus, Benjamin Stévens, Renaud Hoyoux, Gilles Louppe, Rémy Vandaele, Jean-Michel Begon, Philipp Kainz, Pierre Geurts and Louis Wehenkel. Collaborative analysis of multi-gigapixel imaging data using Cytomine, Bioinformatics, DOI: 10.1093/bioinformatics/btw013, 2016. http://dx.doi.org/10.1093/bioinformatics/btw013

