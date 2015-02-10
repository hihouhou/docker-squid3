###############################################
# Debian with added Teamspeak 3 Server.
# Uses SQLite Database on default.
###############################################

# Using latest Ubuntu image as base
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

# Pull base image.
FROM debian:latest

# Install Nginx.
RUN \
  apt-get update && \
  apt-get install -y squid3

# Define mountable directories.
VOLUME ["/var/log/squid3"]

# Define working directory.
WORKDIR /etc/squid3

ADD squid.conf /etc/squid3/

# Define default command.
CMD ["squid3", "-N"]

# Expose ports.
EXPOSE 3128
