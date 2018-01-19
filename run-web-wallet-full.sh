#!/bin/bash

source build/bash-ini-parser/bash-ini-parser

cfg_parser config.ini

echo "===== LOADED config.ini: ==========================="
cfg_writer
echo "===== END OF LOADED CONFIG from config.ini ========="
echo ""

docker run $* -d --name cli-wallet \
           --link trusted-full-node \
           -p 80:80 \
           -v $PWD/web-wallet-data/www:/www \
           -v $PWD/web-wallet-data/conf:/conf \
           bitshares/bitshares-2-webwallet-full:${UI_TAG}
