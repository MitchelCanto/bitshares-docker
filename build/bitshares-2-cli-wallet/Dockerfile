FROM bitshares/bitshares-2:testnet
MAINTAINER Fabian Schuh <Fabian@cryptonomex.com>

## Copying default configuration
ADD docker/start.sh /start.sh
RUN chmod a+x /start.sh

## Entry point
ENTRYPOINT ["/start.sh"]
