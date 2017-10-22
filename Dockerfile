FROM mxrss/salt-stack
LABEL com.mxrss.vendor=mxrss
LABEL version="1.0"
LABEL purpose="GitFS Support added to salt-stack latest"
MAINTAINER Mike Roth

RUN sudo apt-get update -y 
RUN sudo apt-get install pkg-config libssh2-1-dev libhttp-parser-dev libssl-dev libz-dev cmake -y 
RUN sudo wget https://github.com/libgit2/libgit2/archive/v0.26.0.tar.gz --no-check-certificate 
RUN sudo tar xzf v0.26.0.tar.gz 
WORKDIR /libgit2-0.26.0 
RUN sudo cmake . 
RUN sudo make 
RUN sudo make install
RUN sudo apt-get install python-pip libffi-dev python-cffi -y
RUN sudo pip install pygit2

EXPOSE 4505
EXPOSE 4506