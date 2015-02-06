# This file creates a Docker image containing the Couchbase DB

FROM ubuntu:14.04
MAINTAINER Aiden Keating <akeating@tssg.org>

EXPOSE 11210 8091 8092

# Some of those installed programs will not be needed
RUN apt-get update && apt-get install -y librtmp0 python-httplib2 wget software-properties-common python-software-properties && \
    wget --quiet http://packages.couchbase.com/releases/3.0.0/couchbase-server-enterprise_3.0.0-ubuntu12.04_amd64.deb && \
    dpkg -i couchbase-server-enterprise_3.0.0-ubuntu12.04_amd64.deb

ADD bootstrap.sh /home/

ENTRYPOINT ["sh", "/home/bootstrap.sh"]
# May need to run service couchbase-server start on login


    






