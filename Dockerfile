FROM ubuntu:latest
LABEL com.mxrss.vendor=mxrss
LABEL version="1.0"
LABEL purpose="Base image from ubuntu"
MAINTAINER Mike Roth
RUN apt-get update -y
RUN apt-get install sudo wget -y
RUN wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
ADD saltstack.list /etc/apt/sources.list.d/saltstack.list
RUN apt-get update -y
RUN apt-get install salt-master salt-api -y 
