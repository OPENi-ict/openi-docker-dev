$(boot2docker shellinit)

source conf

docker run -i -t -m="2g" -h dev.openi-ict.eu -v $HOST_DIR:/opt/openi/repos/ openiicteu/dev bash /opt/openi/provision/provision.sh