FROM ubuntu:15.04
MAINTAINER Fabian Schuh <Fabian@cryptonomex.com>

ARG tag

## Core Utilities
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y autoconf \
                       autotools-dev \
                       build-essential \
                       cmake \
                       gcc-4.9 \
                       g++-4.9 \
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
                       wget

## Boost 1.57
WORKDIR /
RUN wget -c 'http://sourceforge.net/projects/boost/files/boost/1.57.0/boost_1_57_0.tar.bz2/download' \
         -O /boost_1_57_0.tar.bz2 && \
    tar xjf /boost_1_57_0.tar.bz2
WORKDIR boost_1_57_0/
RUN ./bootstrap.sh "--prefix=/opt/boost_1_57_0" && \
    ./b2 install

## Fetching BitShares-2
WORKDIR /
RUN git clone -b "$tag" https://github.com/BitSharesEurope/testnet.git /bitshares-2-git && \
    git -C /bitshares-2-git submodule update --init --recursive

## Building BitShares-2
RUN mkdir /build
WORKDIR /build
RUN CC=gcc-4.9 CXX=g++-4.9 cmake -DBOOST_ROOT="/opt/boost_1_57_0" -DCMAKE_BUILD_TYPE=Release /bitshares-2-git && \
    make || make -j 1

RUN mkdir /bitshares-2 && \
    cp -r /build/programs /bitshares-2/

## Cleanup to reduce container size
WORKDIR /
RUN rm -rf /boost_1_57_0.tar.bz2 \
           /boost_1_57_0 \
           /bitshares-2-git \
           /build
