#!/bin/bash

# Install gcc and gfortran on EC2 ubuntu-xenial-16.04 (ami-80861296)

#==========================
# for gcc5 and GNU make
#==========================
sudo apt update
sudo apt install build-essential -y
#sudo apt install gcc -y
#sudo apt install g++ -y

#==========================
# for gfortran6/5
# see https://www.scivision.co/install-latest-gfortran-on-ubuntu/
#==========================
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt update
sudo apt install gfortran-6 -y

#==========================
# install pre-compiled netcdf
# has only very limited functionalities
#==========================
# sudo apt install libnetcdf-dev -y
# sudo apt install netcdf-bin -y # for ncdump

#==========================
# for m4 (needed by NetCDF4, not on default ubuntu) 
# see https://www.howtoinstall.co/en/ubuntu/trusty/m4
#==========================
sudo apt-get install m4 -y
