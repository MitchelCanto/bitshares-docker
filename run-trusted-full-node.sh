#!/bin/bash

source build/bash-ini-parser/bash-ini-parser

cfg_parser config.ini

echo "===== LOADED config.ini: ==========================="
cfg_writer
echo "===== END OF LOADED CONFIG from config.ini ========="
echo ""


setup_data_dir "data_trusted_node"

docker run $* --name trusted-full-node \
           -p 9090:9090 \
           --mount type=bind,source=${MY_DATA_DIR},target=/data \
           bitshares/bitshares-2-trusted-full-node:${TAG}
