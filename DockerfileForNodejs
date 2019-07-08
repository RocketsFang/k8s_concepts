###  package a nodejs application to learn k8s concept

FROM ubuntu:16.04

ARG NODEJS_WORKDIR=/opt/k8s_concepts_nodejs
ENV NODEJS_DB_FILE /opt/datastore/nodejsfile

RUN rm /var/lib/dpkg/lock \
    && dpkg --configure -a

RUN apt-get update \
    && apt-get install -y nodejs \
    && apt-get install -y npm \
    && apt-get install -y curl

RUN mkdir -p /opt/k8s_concepts_nodejs/server \
    && mkdir /opt/datastore \
    && touch ${NODEJS_DB_FILE} \
    && echo '### this is the nodejs app file database' > ${NODEJS_DB_FILE}

ADD ./k8s_concepts_nodejs/main/server.js ${NODEJS_WORKDIR}/server

WORKDIR ${NODEJS_WORKDIR}

EXPOSE 8888

ENTRYPOINT ["nodejs", "server/server.js"]
