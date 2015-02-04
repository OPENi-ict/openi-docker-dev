# This file creates a Docker image containing the cloudlet platform

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

EXPOSE 80 443

RUN sudo apt-get -y install librrd-dev python libsqlite3-dev sqlite3 \
    build-essential uuid-dev

RUN git clone https://github.com/OPENi-ict/attachment-api.git && \
    cd  attachment-api/ && npm install

RUN git clone https://github.com/OPENi-ict/auth-api.git && \
    cd auth-api/ && npm install

RUN git clone https://github.com/OPENi-ict/cloudlet-api.git && \
    cd cloudlet-api/ && npm install

RUN git clone https://github.com/OPENi-ict/communications.git && \
    cd communications/ && npm install

RUN git clone https://github.com/OPENi-ict/dao.git && \
    cd dao/ && npm install

RUN git clone https://github.com/OPENi-ict/notifications.git && \
    cd notifications/ && npm install

RUN git clone https://github.com/OPENi-ict/object-api.git && \
    cd object-api/ && npm install

RUN git clone https://github.com/OPENi-ict/permissions_api.git && \
    cd permissions_api/ && npm install

RUN git clone https://github.com/OPENi-ict/search_api.git && \
    cd search_api/ && npm install

RUN git clone https://github.com/OPENi-ict/swagger-def.git && \
    cd swagger-def/ && npm install

RUN git clone https://github.com/OPENi-ict/type-api.git && \
    cd type-api/ && npm install

RUN wget https://github.com/zedshaw/mongrel2/releases/download/v1.9.1/mongrel2-v1.9.1.tar.gz && \
    tar -zxvf mongrel2-v1.9.1.tar.gz && cd  mongrel2-v1.9.1 && make install && \
    cd / && git clone https://github.com/OPENi-ict/mongrel2.git

RUN apt-get purge -y librrd-dev python gcc && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    npm install html-to-text && apt-get install -y rrdtool tmux nano

ADD run_platform.sh /

