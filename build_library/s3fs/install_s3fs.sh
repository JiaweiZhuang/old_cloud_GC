#!/bin/bash
# Install s3fs on ubuntu
# https://github.com/s3fs-fuse/s3fs-fuse

sudo apt-get install -y \
    automake autotools-dev fuse g++ git \
    libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev \
    make pkg-config

git clone https://github.com/s3fs-fuse/s3fs-fuse.git
cd s3fs-fuse
./autogen.sh
./configure
make
sudo make install
