#!/bin/csh
# ===
# === Step-1: Check  variables, echo history and usage
# ===
  if (${#} == 0) then
    echo 'Usage '
    echo ' run.csh file_name month anomaly '
    echo ' For example msl u10 v10 t2m sst'
    echo ' run.csh var 1 1'
  exit
  endif

  set wgrib2_file = ERA_interim_2015.nc
  set var = $1
  set t_beg = $2
  set anomaly = $3
  
    set t81 = 420  # = 197912
    set t10 = 432 # = 201012
    set t14 = 432 # = 201312
   
  if( ${1} == "u10" ) then 
    sed -e 's/wgs_file/'${wgrib2_file}'/' -e 's/wgs_var/'${var}'/' -e 's/wgs_tbeg/'${t_beg}'/' \
      -e 's/wgs_t81/'${t81}'/' -e 's/wgs_t10/'${t10}'/' -e 's/wgs_t14/'${t14}'/' \
      -e 's/wgs_anomaly/'${anomaly}'/' \
    2uv.gs > uv_OK.gs
    grads -bpc uv_OK.gs
  else
    sed -e 's/wgs_file/'${wgrib2_file}'/' -e 's/wgs_var/'${var}'/' -e 's/wgs_tbeg/'${t_beg}'/' \
      -e 's/wgs_t81/'${t81}'/' -e 's/wgs_t10/'${t10}'/' -e 's/wgs_t14/'${t14}'/' \
      -e 's/wgs_anomaly/'${anomaly}'/' \
    2var.gs > 1var_OK.gs
    grads -bpc 1var_OK.gs
  endif
  #rm -f 1var_OK.gs
  #    -e 's/wgs_fyear/'${f_year}'/' -e 's/wgs_fmon/'${f_mon}'/' -e 's/wgs_fday/'${f_day}'/'  \
