###  package a nodejs application to learn k8s concept

FROM ubuntu:16.04

RUN rm /var/lib/dpkg/lock \
    && dpkg --configure -a

RUN apt-get update \
    && apt-get install -y nodejs \
    && apt-get install -y npm \
    && apt-get install -y curl

RUN mkdir -p /opt/k8s_concepts_nodejs/server

ADD ./k8s_concepts_nodejs/main/server.js /opt/k8s_concepts_nodejs/server

EXPOSE 8888

CMD ["nodejs", "/opt/k8s_concepts_nodejs/server/server.js"]
