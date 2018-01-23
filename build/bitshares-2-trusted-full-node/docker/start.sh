#!/bin/bash

#RUNLOG="/data/run-logs/runlog_$(date '+%Y-%m-%d_%H.%M.%S')"

if [[ -n $1 ] && [ -n $2 ] && [ -n $3 ]];
  then
    # All three parameters were supplied. run in witness mode
    echo "All 3 parameters were found so RUNNING IN WITNESS MODE with witness-id: $1"
    /bitshares-2/programs/witness_node/witness_node \
                           --p2p-endpoint="0.0.0.0:9090" \
                           --data-dir=/data/ \
                           --rpc-endpoint="0.0.0.0:8090" \
                           --witness-id '"$1"' \
                           --private-key '["$2","$3"]'

  else
    # Some parameter is not there, so run without witness mode
    echo "Not all 3 parameters were found so running WITHOUT witness ID and Keys"
    /bitshares-2/programs/witness_node/witness_node \
                           --p2p-endpoint="0.0.0.0:9090" \
                           --data-dir=/data/ \
                           --rpc-endpoint="0.0.0.0:8090"
fi
