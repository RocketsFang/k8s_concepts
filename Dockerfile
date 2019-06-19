FROM ubuntu:16.04

RUN rm /var/lib/dpkg/lock \
    & dpkg --configure -a

RUN apt update \
    & apt-get install nodejs \
    & apt-get install npm
