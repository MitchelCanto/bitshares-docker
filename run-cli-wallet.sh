#!/bin/bash

if [ $1 ]; then
  myip=$1
else
  myip=127.0.0.1
fi

if [ $2 ]; then
  myport=$2
else
  myport=8092
fi

#echo "Will run cli-wallet against ${myip}:${myport}"

docker run $* --name cli-wallet \
           --link trusted-full-node \
           -p 127.0.0.1:8092:8092 \
           -it \
           bitshares/bitshares-2-cli-wallet


# docker run $* --name cli-wallet \
#            --link trusted-full-node \
#            -p ${myip}:${myport} \
#            bitshares/bitshares-2-cli-wallet
