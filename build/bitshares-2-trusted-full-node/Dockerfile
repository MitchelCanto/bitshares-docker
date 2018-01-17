ARG tag=2.0.171212
FROM bitshares/bitshares-2:${tag}
ARG tag
LABEL original_maintainer="Fabian Schuh <Fabian@cryptonomex.com>"
LABEL modified_by="Daniel Castaneda <daniel@kwantec.com>"

## Copying default configuration

# Commented creation of data dir
# Becasuse we are Now using a volume instead
# RUN mkdir /data_trusted_node

ADD docker/start.sh /start.sh
RUN chmod a+x /start.sh

## Exposing Ports
EXPOSE 9090
EXPOSE 8090

## Entry point
ENTRYPOINT ["/start.sh"]
