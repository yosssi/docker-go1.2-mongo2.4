# Go 1.2 and MongoDB 2.4
#
# VERSION 1.0

# Use the ubuntu base image provided by dotColud.
FROM ubuntu

MAINTAINER Keiji Yoshida, yoshida.keiji.84@gmail.com

# Update the package lists.
RUN apt-get update

# Install curl and git.
RUN apt-get install -y curl git

# Install Go 1.2.
RUN curl -o /usr/local/go1.2.linux-amd64.tar.gz https://go.googlecode.com/files/go1.2.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf /usr/local/go1.2.linux-amd64.tar.gz
RUN rm /usr/local/go1.2.linux-amd64.tar.gz
ENV PATH $PATH:/usr/local/go/bin

# Install MongoDB 2.4.9.
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
RUN apt-get update
RUN apt-get install -y mongodb-10gen=2.4.9
