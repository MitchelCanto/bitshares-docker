#!/bin/bash

/bitshares-2/programs/witness_node/witness_node \
                       --p2p-endpoint="0.0.0.0:9090" \
                       --data-dir=/data/ \
                       --rpc-endpoint="0.0.0.0:8090"
