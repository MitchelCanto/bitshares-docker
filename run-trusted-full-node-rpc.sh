#!/bin/bash

docker run $* --name bitshares_witness \
           --volumes-from bitshares-data \
           -p 9090:9090 \
           -p 8090:8090 \
           bitshares/witness:testnet
