ARG tag=2.0.171212
FROM bitshares/bitshares-2:${tag}
ARG tag
LABEL original_maintainer="Fabian Schuh <Fabian@cryptonomex.com>"
LABEL modified_by="Daniel Castaneda <daniel@kwantec.com>"

## Copying default configuration
ADD docker/start.sh /start.sh
RUN chmod a+x /start.sh

## Entry point
ENTRYPOINT ["/start.sh"]
