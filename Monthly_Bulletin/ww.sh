#!/bin/sh

# --- GrADS

GADDIR=/export/home/songjun/WGS/soft/new_CentOS/grads/data
GASCRP=/export/home/songjun/WGS/soft/new_CentOS/grads/lib
PATH=$PATH:.:/export/home/songjun/WGS/soft/new_CentOS/grads/bin
export PATH GADDIR GASCRP
grads -pc 1var_OK.gs
