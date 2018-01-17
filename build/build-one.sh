#!/bin/bash

export TAG=2.0.171212
export UI_TAG=2.0.180108
export MEMORY=8g
export CPUS=4

case $1 in
  core)
      echo "Building dock the Base Node Docker Image for BitShares"
      echo "     This is the Base Image for most of the rest of the"
      echo "     Docker images produced by this script,"
      echo "     therefore this MUST be done as first step"
      echo "Parameters:"
      echo "     Version/tag for bitshares-2: ${TAG}"
      echo "     Version/tag for bitshares-ui: ${UI_TAG}"
      echo "     Docker container Memory: ${MEMORY}"
      echo "     Docker container CPUs: ${CPUS}"
      echo "This will take a while, please be patient"
      echo "  script by Daniel Castaneda <daniel@kwantec.com>"
      docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2 --build-arg tag=${TAG} bitshares-2
    ;;
  cli)
      echo "Building the cli-walllet Docker image for BitShares"
      echo "Parameters:"
      echo "     Version/tag for bitshares-2: ${TAG}"
      echo "     Version/tag for bitshares-ui: ${UI_TAG}"
      echo "     Docker container Memory: ${MEMORY}"
      echo "     Docker container CPUs: ${CPUS}"
      echo "This will take a while, please be patient"
      echo "  script by Daniel Castaneda <daniel@kwantec.com>"
      docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-cli-wallet --build-arg tag=${TAG} bitshares-2-cli-wallet
    ;;
  delayed)
      echo "Building the Delayed Node Docker image for BitShares"
      echo "Parameters:"echo "Building the cli-walllet Docker image for BitShares"
      echo "     Version/tag for bitshares-2: ${TAG}"
      echo "     Version/tag for bitshares-ui: ${UI_TAG}"
      echo "     Docker container Memory: ${MEMORY}"
      echo "     Docker container CPUs: ${CPUS}"
      echo "This will take a while, please be patient"
      echo "  script by Daniel Castaneda <daniel@kwantec.com>"
      docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-delayed-node --build-arg tag=${TAG} bitshares-2-delayed-node
    ;;
  full)
      echo "Building the Full Node Docker image for BitShares"
      echo "Parameters:"
      echo "     Version/tag for bitshares-2: ${TAG}"
      echo "     Version/tag for bitshares-ui: ${UI_TAG}"
      echo "     Docker container Memory: ${MEMORY}"
      echo "     Docker container CPUs: ${CPUS}"
      echo "This will take a while, please be patient"
      echo "  script by Daniel Castaneda <daniel@kwantec.com>"
      docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-trusted-full-node --build-arg tag=${TAG} bitshares-2-trusted-full-node
    ;;
  ngnix)
      echo "Building the Docker image for a nginx Web Server"
      echo "   This is not really required as it is also done in the web-full image"
      echo "   We recommend to use the web-full option instead"
      echo "Parameters:"
      echo "     Version/tag for bitshares-2: ${TAG}"
      echo "     Version/tag for bitshares-ui: ${UI_TAG}"
      echo "     Docker container Memory: ${MEMORY}"
      echo "     Docker container CPUs: ${CPUS}"
      echo "This will take a while, please be patient"
      echo "  script by Daniel Castaneda <daniel@kwantec.com>"
      docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-webwallet --build-arg ui_tag=${UI_TAG} bitshares-2-webwallet
    ;;
  web)
      echo "Building the the Docker Image for the BitShares-ui Web Project"
      echo "  this includes the nginx web server in the image as well "
      echo "  as the web-ui nodejs project build."
      echo "Parameters:"
      echo "     Version/tag for bitshares-2: ${TAG}"
      echo "     Version/tag for bitshares-ui: ${UI_TAG}"
      echo "     Docker container Memory: ${MEMORY}"
      echo "     Docker container CPUs: ${CPUS}"
      echo "This will take a while, please be patient"
      echo "  script by Daniel Castaneda <daniel@kwantec.com>"
      docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-webwallet-full --build-arg ui_tag=${UI_TAG} bitshares-2-webwallet-full
    ;;
  all)
      echo "Building docker images for ALL BitShares projects"
      echo "Parameters:"
      echo "     Version/tag for bitshares-2: ${TAG}"
      echo "     Version/tag for bitshares-ui: ${UI_TAG}"
      echo "     Docker container Memory: ${MEMORY}"
      echo "     Docker container CPUs: ${CPUS}"
      echo "This will take a while, please be patient"
      echo "  script by Daniel Castaneda <daniel@kwantec.com>"
      echo "============STARTING CORE IMAGE====================================================================="
      docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2 --build-arg tag=${TAG} bitshares-2
      echo "============STARTING CLI WALLET IMAGE==============================================================="
      docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-cli-wallet --build-arg tag=${TAG} bitshares-2-cli-wallet
      echo "============STARTING DELAYED NODE IMAGE============================================================="
      docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-delayed-node --build-arg tag=${TAG} bitshares-2-delayed-node
      echo "============STARTING FULL NODE IMAGE================================================================"
      docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-trusted-full-node --build-arg tag=${TAG} bitshares-2-trusted-full-node
      echo "============STARTING NGNIX IMAGE===================================================================="
      docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-webwallet-full --build-arg ui_tag=${UI_TAG} bitshares-2-webwallet-full
      echo "============STARTING WEB FULL IMAGE================================================================="
      docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-webwallet --build-arg ui_tag=${UI_TAG} bitshares-2-webwallet
      echo "============DONE BUILDING IMAGES (pl. verify if all went well)======================================"
    ;;
  *)
      echo "Missing required parameter, Usage:"
      echo "    ./build-one all           Builds Docker images for ALL Bitshares Projects"
      echo "    ./build-one core          Builds the base Node docker image. "
      echo "                                    This be done before the others as it is used as"
      echo "                                    base Docker image for the rest of the images."
      echo "    ./build-one cli           Builds the Docker image for the Bitshares cli-wallet"
      echo "    ./build-one delayed       Builds the Docker image for the Bitshares delayed-node"
      echo "    ./build-one full          Builds the Docker image for the Bitshares full-node"
      echo "    ./build-one ngnix         Builds the Docker image for a nginx Web Server"
      echo "                                    This is not really required as it is also done in the web-full image"
      echo "                                    We recommend to use the web-full option instead"
      echo "    ./build-one web           Builds the Docker image for the Bitshares-ui Web Project, "
      echo "                                    this includes the nginx web server in the image as well "
      echo "                                    as the web-ui nodejs project build."
      echo "     Script by Daniel Castaneda <daniel@kwantec.com>"

    ;;

esac

# kept here for reference, DO NOT UNCOMMENT!!
# docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2 --build-arg tag=${TAG} bitshares-2
# docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-cli-wallet --build-arg tag=${TAG} bitshares-2-cli-wallet
# docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-delayed-node --build-arg tag=${TAG} bitshares-2-delayed-node
# docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-trusted-full-node --build-arg tag=${TAG} bitshares-2-trusted-full-node
# docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-webwallet-full --build-arg ui_tag=${UI_TAG} bitshares-2-webwallet-full
# docker build -m ${MEMORY} -c ${CPUS} -t bitshares/bitshares-2-webwallet --build-arg ui_tag=${UI_TAG} bitshares-2-webwallet
