###  package a nodejs application to learn k8s concept

FROM ubuntu:16.04

RUN rm /var/lib/dpkg/lock \
    && dpkg --configure -a

RUN apt-get update \
    && apt-get install nodejs \
    && apt-get install npm
