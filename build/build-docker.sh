#!/bin/bash

docker build -t bitshares/bitshares-2 bitshares-2
docker build -t bitshares/bitshares-2-cli-wallet bitshares-2-cli-wallet
docker build -t bitshares/bitshares-2-delayed-node bitshares-2-delayed-node
docker build -t bitshares/bitshares-2-trusted-full-node bitshares-2-trusted-full-node
docker build -t bitshares/bitshares-2-webwallet-full bitshares-2-webwallet-full
docker build -t bitshares/bitshares-2-webwallet bitshares-2-webwallet
