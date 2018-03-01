#!/bin/bash
# Install singularity on ubuntu
# From http://singularity.lbl.gov/docs-installation
sudo apt-get update && \
    sudo apt-get install \
    python \
    dh-autoreconf \
    build-essential

git clone https://github.com/singularityware/singularity.git
cd singularity
./autogen.sh
./configure --prefix=/usr/local --sysconfdir=/etc
make
sudo make install
