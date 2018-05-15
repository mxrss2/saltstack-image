FROM ubuntu:16.04
LABEL com.mxrss.vendor=mxrss
LABEL version="1.1"
LABEL purpose="Base image switching to alpine"
MAINTAINER Mike Roth
RUN apt-get update && apt-get install wget -y
RUN wget -O bootstrap-salt.sh https://bootstrap.saltstack.com
RUN sh ./bootstrap-salt.sh -N -M stable 2018.3.0
RUN echo manual | tee /etc/init/saltmaster.override
RUN rm -rf /var/run/salt/master/
RUN apt-get install salt-api -y 