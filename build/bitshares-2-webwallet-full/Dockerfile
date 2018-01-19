FROM ubuntu:16.04
LABEL original_maintainer="Fabian Schuh <Fabian@cryptonomex.com>"
LABEL modified_by="Daniel Castaneda <daniel@kwantec.com>"
ARG ui_tag

## Core Utilities
RUN apt-get update
RUN apt-get -y upgrade
# RUN apt-get install -y nodejs npm git nginx

RUN apt-get install -y curl

# RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
# RUN nvm install v6
# RUN nvm use v6

RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs build-essential git nginx
RUN npm install -g coffeescript

RUN git clone -b "$ui_tag" https://github.com/bitshares/bitshares-ui.git /build
WORKDIR /build

RUN npm install
RUN npm run build

RUN mkdir /www

WORKDIR /build/build/dist
RUN cp -rv * /www/

WORKDIR /build

ADD nginx.conf /etc/nginx/nginx.conf

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD service nginx start
