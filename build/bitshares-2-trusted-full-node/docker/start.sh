#!/bin/bash

#RUNLOG="/data/run-logs/runlog_$(date '+%Y-%m-%d_%H.%M.%S')"

/bitshares-2/programs/witness_node/witness_node \
                       --p2p-endpoint="0.0.0.0:9090" \
                       --data-dir=/data/ \
                       --rpc-endpoint="0.0.0.0:8090"
                       #> ${RUNLOG} &
