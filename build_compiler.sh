#!/bin/bash

# Install basic software (including gcc and gfortran) 
# Tested on EC2 ubuntu-xenial-16.04 (ami-80861296)

#==========================
# for gitk and git-gui 
# use "ssh -Y" to login to allow x11 forwarding 
#==========================
sudo apt install git-gui
sudo apt install gitk

#==========================
# for gcc5 and GNU make
#==========================
sudo apt update
sudo apt install build-essential -y
#sudo apt install gcc -y
#sudo apt install g++ -y

#==========================
# for gfortran6
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
