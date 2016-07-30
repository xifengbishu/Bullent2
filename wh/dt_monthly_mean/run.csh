#!/bin/csh
# ===
# === Step-1: Check  variables, echo history and usage
# ===
  if (${#} == 0) then
    echo 'Usage '
    echo ' run.csh month year anomaly '
    echo ' For example '
    echo ' run.csh 07 2010 1'
  exit
  endif
  
  ncbo --op_typ=add dt_global_allsat_msla_h_y2006_m09.nc dt_global_allsat_msla_h_y2006_m08.nc www.nc
  exit
  set month = $1
  ncea ./dt_global_allsat_msla_h_y199[3-9]_m${month}.nc dt_global_allsat_msla_h_y19${month}.nc
  ncea ./dt_global_allsat_msla_h_y200[0-9]_m${month}.nc dt_global_allsat_msla_h_y20${month}.nc
  ncea ./dt_global_allsat_msla_h_y201[0-1]_m${month}.nc dt_global_allsat_msla_h_y21${month}.nc
  ncea dt_global_allsat_msla_h_y19${month}.nc dt_global_allsat_msla_h_y20${month}.nc dt_global_allsat_msla_h_y21${month}.nc dt_global_allsat_msla_h_m${month}.nc
  #rm -f dt_global_allsat_msla_h_y19${month}.nc dt_global_allsat_msla_h_y20${month}.nc dt_global_allsat_msla_h_y21${month}.nc
  exit
  set year = $2
  set anomaly = $3
  
  sed -e 's/wgs_year/'${year}'/' -e 's/wgs_month/'${month}'/' -e 's/wgs_anomaly/'${anomaly}'/' \
  ssh.gs > ssh_OK.gs
  grads -bpc ssh_OK.gs
