# This file creates a Docker image containing the Couchbase DB

FROM ubuntu:14.04
MAINTAINER Aiden Keating <akeating@tssg.org>

EXPOSE 11210 8091 8092

# Some of those installed programs will not be needed
RUN apt-get update && apt-get install -y openssh-server supervisor librtmp0 python-httplib2 xdotool wget software-properties-common python-software-properties && \
    wget --quiet http://packages.couchbase.com/releases/3.0.0/couchbase-server-enterprise_3.0.0-ubuntu12.04_amd64.deb && \
    dpkg -i couchbase-server-enterprise_3.0.0-ubuntu12.04_amd64.deb

RUN service couchbase-server start && \
    /bin/sleep 20 && \
    /opt/couchbase/bin/couchbase-cli cluster-init --cluster=127.0.0.1:8091 --user=admin --password=password --cluster-ramsize=2372 && \
    /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=objects     --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password && \
    /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=types       --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password && \
    /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=attachments --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password && \
    /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=permissions --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password && \
    /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=users       --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password && \
    /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=clients     --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password && \
    /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=dbkeys      --bucket-type=couchbase --bucket-ramsize=100 --bucket-replica=0 -u admin -p password


ADD bin/couchbase-script /usr/local/sbin/couchbase
RUN chmod 755 /usr/local/sbin/couchbase && chmod -R 755 /opt/couchbase/var

CMD /usr/local/sbin/couchbase


#ENTRYPOINT /bin/bash
    






