#!/bin/bash

source build/bash-ini-parser/bash-ini-parser

cfg_parser config.ini

echo "===== LOADED config.ini: ==========================="
cfg_writer
echo "===== END OF LOADED CONFIG from config.ini ========="
echo ""

docker run $* --name cli-wallet \
           --link trusted-full-node \
           -p 127.0.0.1:8092:8092 \
           -it \
           bitshares/bitshares-2-cli-wallet:${TAG}


# docker run $* --name cli-wallet \
#            --link trusted-full-node \
#            -p ${myip}:${myport} \
#            bitshares/bitshares-2-cli-wallet
