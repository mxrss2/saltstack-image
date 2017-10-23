FROM mxrss/salt-stack
LABEL com.mxrss.vendor=mxrss
LABEL version="1.0"
LABEL purpose="GitFS Support added to salt-stack latest"
MAINTAINER Mike Roth

RUN sudo apt-get update -y 
RUN sudo apt-get install cmake python-dev python-pip \
    libffi-dev libssh2-1-dev zlib1g-dev libssl-dev \
    pkg-config libhttp-parser-dev -y
RUN sudo wget https://github.com/libgit2/libgit2/archive/v0.26.0.tar.gz --no-check-certificate 
RUN sudo tar xzf v0.26.0.tar.gz 
WORKDIR /libgit2-0.26.0 
RUN sudo cmake . 
RUN sudo make 
RUN sudo make install
RUN sudo apt-get install python-pip libffi-dev python-cffi -y
RUN sudo ldconfig

RUN sudo pip install --upgrade pip
RUN sudo pip uninstall pygit2 -y
RUN sudo pip install pygit2 

EXPOSE 4505
EXPOSE 4506