$(boot2docker shellinit)

source conf

docker run -i -t -m="2g" -h dev.openi-ict.eu  -p 80:80 -p 443:443 -p 8091:8091 -p 9200:9200 \
-v $HOST_DIR:/opt/openi/repos/ -v $UPLOAD_DIR:/opt/openi/cloudlet_platform/uploads \
openiicteu/dev bash

