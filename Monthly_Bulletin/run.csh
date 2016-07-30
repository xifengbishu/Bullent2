#!/bin/csh
# ===
# === Step-1: Check  variables, echo history and usage
# ===
  if (${#} == 0) then
    echo 'Usage '
    echo ' run.csh file_name month anomaly '
    echo ' For example '
    echo ' run.csh air.2m.mon.mean.nc 1 1'
  exit
  endif

  set wgrib2_file = $1
  set var = ` echo $wgrib2_file | cut -c1-3 `
  set t_beg = $2
  set anomaly = $3
  
  if ( $var == "sst" ) then
    set t81 = 1
    set t10 = 349
    set t14 = 409
  else
    set t81 = 396
    set t10 = 756
    set t14 = 816
  endif
   
  sed -e 's/wgs_file/'${wgrib2_file}'/' -e 's/wgs_var/'${var}'/' -e 's/wgs_tbeg/'${t_beg}'/' \
      -e 's/wgs_t81/'${t81}'/' -e 's/wgs_t10/'${t10}'/' -e 's/wgs_t14/'${t14}'/' \
      -e 's/wgs_anomaly/'${anomaly}'/' \
  1var.gs > 1var_OK.gs
  grads -bpc 1var_OK.gs
  #rm -f 1var_OK.gs
  #    -e 's/wgs_fyear/'${f_year}'/' -e 's/wgs_fmon/'${f_mon}'/' -e 's/wgs_fday/'${f_day}'/'  \
