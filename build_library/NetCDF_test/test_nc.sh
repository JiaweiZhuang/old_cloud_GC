#!/bin/bash
# -L/usr/lib can be omiited

gfortran -o write_nc_f90.exe simple_xr_wr.f90 -I/usr/include -lnetcdff
./write_nc_f90.exe

gfortran -o write_nc_f77.exe simple_xr_wr.f -I/usr/include -lnetcdff
./write_nc_f77.exe
