#!/bin/bash

export TAG=2.0.171212
docker build -m 8g -c 4 -t bitshares/bitshares-2:${TAG} --build-arg tag=${TAG} bitshares-2
