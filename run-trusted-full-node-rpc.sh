#!/bin/bash

# if [ ! -d "bitshares-data" ]; then
#   mkdir bitshares-data
# fi

# if [ ! -d "bitshares-data/data_trusted_node" ]; then
#   mkdir bitshares-data/data_trusted_node
# fi

# curdir=$PWD          # to assign to a variable
# echo "${curdir}/bitshares-data/data_trusted_node,target=/data_trusted_node"
# --mount type=volume,source==${curdir}/bitshares-data/data_trusted_node,target=/data_trusted_node \

docker run $* --name trusted-full-node \
             -p 9090:9090 \
             -p 8090:8090 \
             --mount type=volume,source=data_trusted_node,target=/data_trusted_node \
             bitshares/bitshares-2-trusted-full-node


# docker run $* --name bitshares_witness \
#            --volumes-from bitshares-data \
#            -p 9090:9090 \
#            -p 8090:8090 \
#            bitshares/witness:testnet
