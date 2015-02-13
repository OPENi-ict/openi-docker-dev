source ../../conf

#                 Container                                                                               Image
docker run -d --name openicb -v $COUCHBASE_DATA_DIR:/opt/couchbase/var -p 80:80 -p 443:443 -p 8091:8091  openiicteu/couchbase_dev
