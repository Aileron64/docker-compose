DATETIME=$(date +%Y.%m.%d_%H:%M:%S)

mkdir -p logs/$DATETIME
docker logs core >& logs/$DATETIME/core.txt
docker logs ims >& logs/$DATETIME/ims.txt
docker logs web_UI >& logs/$DATETIME/web_ui.txt
docker logs iipCyto >& logs/$DATETIME/iipcyto.txt
docker logs software_router >& logs/$DATETIME/software_router.txt
docker logs nginx >& logs/$DATETIME/nginx.txt
docker logs bioformat >& logs/$DATETIME/bioformat.txt
docker logs iipOff >& logs/$DATETIME/iipoff.txt
docker logs slurm >& logs/$DATETIME/slurm.txt
docker logs mongodb >& logs/$DATETIME/mongodb.txt
docker logs rabbitmq >& logs/$DATETIME/rabbitmq.txt
docker logs memcached >& logs/$DATETIME/memcached.txt