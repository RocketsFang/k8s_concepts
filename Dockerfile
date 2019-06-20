###  package a nodejs application to learn k8s concept

FROM ubuntu:16.04

RUN rm /var/lib/dpkg/lock \
    && dpkg --configure -a

RUN apt-get update \
    && apt-get install -y nodejs \
    && apt-get install -y npm
