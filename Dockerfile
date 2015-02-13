FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

EXPOSE 80 443

RUN apt-get update -q && apt-get install -y librrd-dev python libsqlite3-dev sqlite3 build-essential uuid-dev rrdtool tmux nano python-pip \
libpq-dev python-dev openjdk-7-jdk maven libjansi-java libscrypt-dev curl python-pip nmap


RUN wget https://github.com/zedshaw/mongrel2/releases/download/v1.9.1/mongrel2-v1.9.1.tar.gz && \
tar -zxvf mongrel2-v1.9.1.tar.gz && cd  mongrel2-v1.9.1 && make install

RUN mkdir -p /opt/openi/ && npm install --prefix /opt/openi/ OPENi-ict/m2nodehandler  &&  \
    npm install --prefix /opt/openi/ jsonwebtoken@3.2.0       &&  \
    npm install --prefix /opt/openi/ OPENi-ict/openi_rrd      &&  \
    npm install --prefix /opt/openi/ OPENi-ict/dbc      &&  \
    npm install --prefix /opt/openi/ elasticsearch@^2.3.0      &&  \
    npm install --prefix /opt/openi/ OPENi-ict/loglet      &&  \
    npm install --prefix /opt/openi/ moment      &&  \
    npm install --prefix /opt/openi/ OPENi-ict/cloudlet-utils      &&  \
    npm install --prefix /opt/openi/ OPENi-ict/openi-logger      &&  \
    npm install --prefix /opt/openi/ underscore@^1.6.0      &&  \
    npm install --prefix /opt/openi/ validator      &&  \
    npm install --prefix /opt/openi/ OPENi-ict/dbc      &&  \
    npm install --prefix /opt/openi/ uuid      &&  \
    npm install --prefix /opt/openi/ scrypt      &&  \
    npm install --prefix /opt/openi/ grunt@^0.4.5      &&  \
    npm install --prefix /opt/openi/ grunt-contrib-jshint@^0.10.0      &&  \
    npm install --prefix /opt/openi/ jshint-stylish@^1.0.0      &&  \
    npm install --prefix /opt/openi/ elasticsearch@^2.3.0      &&  \
    npm install --prefix /opt/openi/ underscore@^1.6.0      &&  \
    npm install --prefix /opt/openi/ Orion98MC/node_rrd      &&  \
    npm install --prefix /opt/openi/ async      &&  \
    npm install --prefix /opt/openi/ winston      &&  \
    npm install --prefix /opt/openi/ body-parser      &&  \
    npm install --prefix /opt/openi/ cookie-parser      &&  \
    npm install --prefix /opt/openi/ debug@~2.1.1      &&  \
    npm install --prefix /opt/openi/ ejs@~2.1.4      &&  \
    npm install --prefix /opt/openi/ express      &&  \
    npm install --prefix /opt/openi/ express-session      &&  \
    npm install --prefix /opt/openi/ jwt-simple      &&  \
    npm install --prefix /opt/openi/ morgan      &&  \
    npm install --prefix /opt/openi/ serve-favicon      &&  \
    npm install --prefix /opt/openi/ zmq@~2.5.1      &&  \
    npm install --prefix /opt/openi/ couchbase@2.0.1      &&  \
    npm install --prefix /opt/openi/ http-status      &&  \
    npm install --prefix /opt/openi/ gcm               &&  \
    npm install --prefix /opt/openi/ lazy.js         &&  \
    npm install --prefix /opt/openi/ dropbox

ADD utils          /opt/openi/utils
ADD provision      /opt/openi/provision
ADD docker         /opt/openi/docker

RUN mkdir -p /opt/openi/repos && mkdir -p /opt/openi/repos/openi_rrd
