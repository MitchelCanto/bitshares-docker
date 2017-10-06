#!/bin/bash

export TAG=testnet
docker build -t bitshares/bitshares-2:${TAG} --build-arg tag=${TAG} bitshares-2
