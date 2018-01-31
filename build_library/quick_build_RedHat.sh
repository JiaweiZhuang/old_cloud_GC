#!/bin/bash

# The quickest way to install NetCDF libraries on RedHat/CentOS/AmazonLinux

# sudo yum update -y # this take quite long, don't have to do it
sudo yum install -y git vim emacs # RHEL and CentOS both lack them
sudo yum install -y gcc gcc-gfortran gcc-c++

# Pre-built NC lib is in only available in EPEL
# see https://aws.amazon.com/premiumsupport/knowledge-center/ec2-enable-epel/
sudo yum-config-manager --enable epel # for Amazon Linux
#sudo yum install -y epel-release # for CentOS

# this pre-built packages lacks netcdf.mod
# But GC-classic only uses `include 'netcdf.inc'`, not `use netcdf`
sudo yum install -y netcdf-devel netcdf-fortran-devel 
