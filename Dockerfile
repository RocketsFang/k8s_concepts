FROM ubuntu:16.04

RUN apt-get update \
    & apt-get install nodejs \
    & apt-get install npm
