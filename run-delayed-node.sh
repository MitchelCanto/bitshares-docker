#!/bin/bash

source build/bash-ini-parser/bash-ini-parser

cfg_parser config.ini

echo "===== LOADED config.ini: ==========================="
cfg_writer
echo "===== END OF LOADED CONFIG from config.ini ========="
echo ""

setup_data_dir "data_delayed_node"

docker run $* --name delayed-node \
           --link trusted-full-node \
           -p 127.0.0.1:8091:8091 \
           --mount type=bind,source=${MY_DATA_DIR},target=/data \
           bitshares/bitshares-2-delayed-node:${TAG}
