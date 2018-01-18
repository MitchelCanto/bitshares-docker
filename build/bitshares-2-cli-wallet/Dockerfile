ARG tag=2.0.171212
FROM bitshares/bitshares-2:${tag}
ARG tag
LABEL original_maintainer="Fabian Schuh <Fabian@cryptonomex.com>"
LABEL modified_by="Daniel Castaneda <daniel@kwantec.com>"

## Copying default configuration
ADD docker/start.sh /bitshares-2/start.sh
RUN chmod ug+x /bitshares-2/start.sh

## Entry point
ENTRYPOINT ["/bitshares-2/start.sh"]
