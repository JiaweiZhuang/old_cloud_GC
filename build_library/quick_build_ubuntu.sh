#!/bin/bash

# The quickest way to install NetCDF libraries. Can then compile GEOS-Chem.
# Tested on EC2 ubuntu-xenial-16.04 (ami-80861296)

sudo apt-get update
sudo apt-get install -y \
    bc gcc gfortran \
    libnetcdf-dev libnetcdff-dev \
    netcdf-bin ncview
