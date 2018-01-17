FROM nginx
LABEL original_maintainer="Fabian Schuh <Fabian@cryptonomex.com>"
LABEL modified_by="Daniel Castaneda <daniel@kwantec.com>"
ARG ui_tag=2.0.180108

## Mount external data into the container
VOLUME ["/www", "/conf"]

## Default nginx configuration
ADD nginx.conf /etc/nginx/nginx.conf

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80 443

# Set the default command to execute
# when creating a new container
CMD service nginx start
