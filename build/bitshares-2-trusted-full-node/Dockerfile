ARG tag=2.0.171212
FROM bitshares/bitshares-2:${tag}
ARG tag
LABEL original_maintainer="Fabian Schuh <Fabian@cryptonomex.com>"
LABEL modified_by="Daniel Castaneda <daniel@kwantec.com>"


ADD docker/start.sh /bitshares-2/start.sh
RUN chmod ug+x /bitshares-2/start.sh

## Exposing Ports
EXPOSE 9090
EXPOSE 8090

USER bitshares

## Entry point
ENTRYPOINT ["/bitshares-2/start.sh"]

# Optional parameters (if supplied then all 3 are required)
# witness-id, witness-key1, witness-key2
CMD ["","",""]
