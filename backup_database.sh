
DATETIME=$(date +%Y.%m.%d_%H:%M:%S)

mkdir -p utils/$DATETIME

bash utils/backup_mongo.sh ./utils/$DATETIME/manBU
bash utils/backup_postgis.sh ./utils/$DATETIME/manBU.sql

# bash utils/restore_postgis.sh ./utils/$DATETIME/manBU.sql