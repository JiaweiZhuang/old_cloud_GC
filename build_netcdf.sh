#!/bin/bash

# Install NetCDF4 (along with zlib and HDF5 it needs) from the source code
# Originally written by Seb Eastham

# Set up the compilers
export FC=gfortran-6
export F90=$FC
export F9X=$FC
export F77=$FC
export CC=gcc
export CXX=g++

# Set up an installation directory
installDir=$HOME/local
srcDir=$HOME/src
clobberDir=0
if [[ -d $installDir ]]; then
   echo "WARNING: Installation directory already exists"
   if [[ $clobberDir -eq 0 ]]; then
      echo "Clobbering disabled. To proceed with the installation, either delete the current installation directory or (UNSAFE) set clobberDir in the installation script to a non-zero value"
      exit 1
   fi
else
   mkdir $installDir
fi

if [[ ! -d $srcDir ]]; then
   mkdir $srcDir
fi

# Needed for NetCDF installation
export ZDIR=$installDir
export H5DIR=$installDir
export NCDIR=$installDir
export NFDIR=$installDir

# NOTE: The installation instructions for HDF5 and NetCDF will show only "make check" and "make install", but this can
# sometimes result in failure due to a bad build order. Running "make -> make check -> make install" is slower but safer.
echo " The following packages will be downloaded and installed:"
echo " ZLib =============> $ZDIR"
echo " HDF5 =============> $H5DIR"
echo " NetCDF-C =========> $NCDIR"
echo " NetCDF-Fortran ===> $NFDIR"

# 1. Install ZLib
echo "Installing ZLib to $ZDIR"
cd $srcDir
mkdir -p zlib
cd zlib
wget -c -nd "http://www.zlib.net/zlib-1.2.11.tar.gz"
tar -xzf zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure --prefix=${ZDIR}
sudo make
sudo make check
sudo make install

if [[ -e $ZDIR/lib/libz.a ]]; then
   echo "ZLib successfully installed"
else
   echo "Installation failed: ZLib. Aborting"
   exit 2
fi

# 2. Install HDF5
echo "Installing HDF-5 to $H5DIR"
cd $srcDir
mkdir -p hdf5
cd hdf5
wget -c -nd "https://support.hdfgroup.org/ftp/HDF5/current18/src/hdf5-1.8.18.tar.gz"
tar -xzf hdf5-1.8.18.tar.gz
cd hdf5-1.8.18
./configure --with-zlib=${ZDIR} --prefix=${H5DIR}
sudo make
sudo make check
sudo make install

if [[ -e $H5DIR/bin/h5copy ]]; then
   echo "HDF-5 successfully installed"
else
   echo "Installation failed: HDF-5. Aborting"
   exit 2
fi

# Add HDF5 libraries to LD_LIBRARY_PATH
export LD_LIBRARY_PATH=${H5DIR}/lib:${LD_LIBRARY_PATH}

# 3. Install NetCDF-C
echo "Installing NetCDF-C to $NCDIR"
cd $srcDir
mkdir -p netcdf-c
cd netcdf-c
wget -c -nd "ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.4.1.1.tar.gz"
tar -xzf netcdf-4.4.1.1.tar.gz
cd netcdf-4.4.1.1
CPPFLAGS=-I${H5DIR}/include LDFLAGS=-L${H5DIR}/lib ./configure --prefix=${NCDIR}
sudo make
sudo make check
sudo make install

if [[ -e $NCDIR/bin/nc-config ]]; then
   echo "NetCDF-C successfully installed"
else
   echo "Installation failed: NetCDF-C. Aborting"
   exit 2
fi

# 4. Install NetCDF-Fortran
echo "Installing NetCDF-Fortran to $NFDIR"
cd $srcDir
mkdir -p netcdf-fortran
cd netcdf-fortran
wget -c -nd "ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.4.4.tar.gz"
tar -xzf netcdf-fortran-4.4.4.tar.gz
cd netcdf-fortran-4.4.4
CPPFLAGS=-I${NCDIR}/include LDFLAGS=-L${NCDIR}/lib ./configure --prefix=${NFDIR}
sudo make
sudo make check
sudo make install

if [[ -e $NFDIR/bin/nf-config ]]; then
   echo "NetCDF-Fortran successfully installed"
else
   echo "Installation failed: NetCDF-Fortran. Aborting"
   exit 2
fi
