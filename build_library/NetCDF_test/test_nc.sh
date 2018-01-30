#!/bin/bash

# -L/usr/lib can be omiited
gfortran simple_xr_wr.f90 -o write_nc_f90.exe -I/usr/include -lnetcdff
./write_nc_f90.exe
ncdump -h simple_xy_f90.nc

gfortran simple_xr_wr.f -o write_nc_f77.exe -I/usr/include -lnetcdff
./write_nc_f77.exe
ncdump -h simple_xy_f77.nc
