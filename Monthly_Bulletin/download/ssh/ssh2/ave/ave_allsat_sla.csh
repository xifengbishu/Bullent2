#!/bin/csh
# ===
# === Step-1: Check  variables, echo history and usage
# === sla anomaly for 2010 - ave(1993---2010) 
# === sla anomaly for 2010 - 2009 

  if (${#} == 0) then
    echo 'Usage '
    echo ' run.csh year month'
    echo ' For example '
    echo ' run.csh 2010 07 '
  exit
  endif

  set year = $1
  set month = $2
  set anomaly = $3
  set mete_root = /public/flow/WGS/Bulletin/Monthly_Bulletin/download/ssh/ssh2/new_metedate

  mkdir temp
  rm -f temp/*
  
  ln -s $mete_root/nrt_global_allsat_msla_h_${year}${month}*.nc ./temp
  cd temp
  set num = 1
  foreach file ( `ls *nc` )
   echo $file' '$num
   ncks -v sla $file ww_$num.nc 
   set num = `expr $num + 1`
  end
  ncea ww_*nc ave_nrt_global_allsat_msla_h_${year}${month}.nc
  # ====== cha ====  
  set year2 = `expr $year - 1`
  set dt_root = /public/flow/WGS/Bulletin/Monthly_Bulletin/download/ssh/dt_monthly_mean
  ncks -v sla ${dt_root}/dt_global_allsat_msla_h_y${year2}_m${month}.nc sla_y${year2}_m${month}.nc
  ncbo --op_typ=- ave_nrt_global_allsat_msla_h_${year}${month}.nc sla_y${year2}_m${month}.nc cha_climate_y${year}_m${month}.nc
  mv cha_climate_y${year}_m${month}.nc ave_nrt_global_allsat_msla_h_${year}${month}.nc ../
  cd ..
