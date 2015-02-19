###############################################
# Debian with added Squid3 Server.
# No cache only proxy.
###############################################

# Using latest debian image as base
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

# Pull base image.
FROM debian:latest

# Install squid3
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
