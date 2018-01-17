FROM ubuntu:16.04
MAINTAINER Fabian Schuh <Fabian@cryptonomex.com>

ARG tag

## Core Utilities
RUN \
    apt-get update -y && \
    apt-get -y upgrade && \
    apt-get install -y autoconf  \
                       autotools-dev \
                       build-essential \
                       cmake \
                       gcc \
                       g++ \
                       git \
                       libbz2-dev \
                       libdb++-dev \
                       libdb-dev \
                       libicu-dev \
                       libreadline-dev \
                       libssl-dev \
                       libtool \
                       make \
                       openssl \
                       python-dev \
                       wget \
                       libboost-all-dev \
                       libncurses-dev \
                       doxygen \
                       libcurl4-openssl-dev \
                       && \
    apt-get update -y && \
    apt-get install -y fish && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## Fetching BitShares-2
WORKDIR /
RUN git clone -b "$tag" https://github.com/bitshares/bitshares-core.git /bitshares-2-git && \
    git -C /bitshares-2-git submodule update --init --recursive

## Building BitShares-2
RUN mkdir /build
WORKDIR /build
RUN cmake -DCMAKE_BUILD_TYPE=Release /bitshares-2-git && \
    make || make -j 1

RUN mkdir /bitshares-2 && \
    cp -r /build/programs /bitshares-2/

## Cleanup to reduce container size
WORKDIR /
RUN rm -rf /bitshares-2-git \
           /build
