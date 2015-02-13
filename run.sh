$(boot2docker shellinit)

source conf

docker run -d --name cb -v $COUCHBASE_DATA_DIR:/opt/couchbase/var -p 8091:8091  -p 8092:8092 openiicteu/couchbase_dev

docker run -i -t -m="2g" -h dev.openi-ict.eu  -p 80:80 -p 443:443 -p 49500:49500 -p 49901:49901 \
-v $HOST_DIR:/opt/openi/repos/ -v $UPLOAD_DIR:/opt/openi/cloudlet_platform/uploads \
--link cb:openicb openiicteu/dev bash


docker run -d --name cb -v /Users/dmccarthy/work/openi/couchbase_data:/opt/couchbase/var -p 8091:8091 -p 8092:8092 openiicteu/couchbase_dev