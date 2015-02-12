FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

EXPOSE 80 443

RUN sudo apt-get -y install librrd-dev python libsqlite3-dev sqlite3 \
    build-essential uuid-dev rrdtool tmux nano && mkdir repos && npm install html-to-text

WORKDIR /repos/

ADD run_platform.sh /repos/

RUN cd /repos/ && git clone https://github.com/OPENi-ict/attachment-api.git && \
    cd  attachment-api/ && npm install

RUN cd /repos/ && git clone https://github.com/OPENi-ict/auth-api.git && \
    cd auth-api/ && npm install

RUN cd /repos/ && git clone https://github.com/OPENi-ict/cloudlet-api.git && \
    cd cloudlet-api/ && npm install

RUN cd /repos/ && git clone https://github.com/OPENi-ict/communications.git && \
    cd communications/ && npm install

RUN cd /repos/ && git clone https://github.com/OPENi-ict/dao.git && \
    cd dao/ && npm install

RUN cd /repos/ && git clone https://github.com/OPENi-ict/notifications.git && \
    cd notifications/ && npm install

RUN cd /repos/ && git clone https://github.com/OPENi-ict/object-api.git && \
    cd object-api/ && npm install

RUN cd /repos/ && git clone https://github.com/OPENi-ict/permissions_api.git && \
    cd permissions_api/ && npm install

RUN cd /repos/ && git clone https://github.com/OPENi-ict/search_api.git && \
    cd search_api/ && npm install

RUN cd /repos/ && git clone https://github.com/OPENi-ict/swagger-def.git && \
    cd swagger-def/ && npm install

RUN cd /repos/ && git clone https://github.com/OPENi-ict/type-api.git && \
    cd type-api/ && npm install

RUN wget https://github.com/zedshaw/mongrel2/releases/download/v1.9.1/mongrel2-v1.9.1.tar.gz && \
    tar -zxvf mongrel2-v1.9.1.tar.gz && cd  mongrel2-v1.9.1 && make install && \
    cd /repos/ && git clone https://github.com/OPENi-ict/mongrel2.git 
