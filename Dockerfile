###  package a nodejs application to learn k8s concept

FROM ubuntu:16.04

RUN rm /var/lib/dpkg/lock \
    && dpkg --configure -a

RUN apt-get update \
    && apt-get install -y nodejs \
    && apt-get install -y npm \
    && apt-get install -y curl

RUN mkdir -p /opt/k8s_concepts_nodejs/server \
    && mkdir /opt/datastore \
    && touch /opt/datastore/nodejsfile

ADD ./k8s_concepts_nodejs/main/server.js /opt/k8s_concepts_nodejs/server

WORKDIR /opt/k8s_concepts_nodejs

EXPOSE 8888

ENTRYPOINT ["nodejs", "server/server.js"]
