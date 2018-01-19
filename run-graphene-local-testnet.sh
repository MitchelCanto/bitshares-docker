#!/bin/bash

source build/bash-ini-parser/bash-ini-parser

cfg_parser config.ini

echo "===== LOADED config.ini: ==========================="
cfg_writer
echo "===== END OF LOADED CONFIG from config.ini ========="
echo ""

docker run $* --name private-testnet \
           -p 9190:9090 \
           -p 8190:8090 \
           graphene/graphene-private-testnet
