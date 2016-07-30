#!/bin/csh
# ===
# === Step-1: Check  variables, echo history and usage
# ===
  if (${#} == 0) then
    echo 'Usage '
    echo ' run.csh month '
    echo ' For example '
    echo ' run.csh 04 '
  exit
  endif
  set year = 2015
  set year2 = `expr $year - 1`

  ncbo --op_typ=- year_ave_nrt_global_allsat_msla_h_${year}.nc year_ave_nrt_global_allsat_msla_h_${year2}.nc  cha_year_ave_nrt_global_allsat_msla_h_y${year}-${year2}.nc
exit
set month = $1
#ncea ../ori_file/nrt_global_merged_msla_h_2014${month}*nc nrt_global_merged_msla_h_2014${month}.nc
#ncea ../ori_file/nrt_global_merged_msla_h_2013${month}*nc nrt_global_merged_msla_h_2013${month}.nc
ncea ../new_metedate/nrt_global_allsat_msla_h_2014${month}*nc nrt_global_allsat_msla_h_2014${month}.nc
ncea ../ori_file/nrt_global_merged_msla_h_2013${month}*nc nrt_global_merged_msla_h_2013${month}.nc
