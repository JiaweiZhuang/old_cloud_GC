#!/bin/bash

# The quickest way to install NetCDF libraries. Can then compile GEOS-Chem.
# Tested on EC2 ubuntu-xenial-16.04 (ami-80861296)

sudo apt-get update
sudo apt-get install -y bc # calculator. GC calls it at compile time
sudo apt-get install -y gcc gfortran # compiler
sudo apt-get install -y libnetcdf-dev libnetcdff-dev # NC lib
sudo apt-get install -y netcdf-bin ncview # NC analysis tool
