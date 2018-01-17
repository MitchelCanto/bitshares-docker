#!/bin/bash

export TAG=2.0.171212
export UI_TAG=2.0.180108
export MEMORY=8g
export CPUS=4
docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2 --build-arg tag=${TAG} bitshares-2
docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-cli-wallet --build-arg tag=${TAG} bitshares-2-cli-wallet
docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-delayed-node --build-arg tag=${TAG} bitshares-2-delayed-node
docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-trusted-full-node --build-arg tag=${TAG} bitshares-2-trusted-full-node
docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-webwallet-full --build-arg ui_tag=${UI_TAG} bitshares-2-webwallet-full
docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-webwallet --build-arg ui_tag=${UI_TAG} bitshares-2-webwallet
