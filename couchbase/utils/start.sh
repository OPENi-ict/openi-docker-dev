CB_VOL_PATH="/home/openi/couchbase"

#                 Container                                                                               Image
docker run -d --name openicb -v $CB_VOL_PATH:/opt/couchbase/var -p 80:80 -p 443:443 -p 8091:8091  openiicteu/couchbase create
