$(boot2docker shellinit)

source conf

#docker run -d -t --name openi_couchbase_dev -h dev.openi-ict.eu -v $COUCHBASE_DATA_DIR:/opt/couchbase/var \
#  -p 8092:8092 -p 11210:11210 -p 8091:8091 openiicteu/couchbase_dev

docker run -d $(./scripts/ports raz) -name cb -v $COUCHBASE_DATA_DIR:/opt/couchbase/var ncolomer/couchbase

docker run -i -t -m="2g" -h dev.openi-ict.eu  -p 80:80 -p 443:443 -p 9200:9200 \
-v $HOST_DIR:/opt/openi/repos/ -v $UPLOAD_DIR:/opt/openi/cloudlet_platform/uploads \
--link openi_couchbase_dev:openi_couchbase_dev openiicteu/dev bash

