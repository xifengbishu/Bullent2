#!/bin/csh
# ===
# === Step-1: Check  variables, echo history and usage
# ===
  if (${#} == 0) then
    echo 'Usage '
    echo ' run.csh year '
    echo ' For example '
    echo ' run.csh 2010'
  exit
  endif

  set wgrib2_file = $1
  set var = ` echo $wgrib2_file | cut -c1-3 `
   
  sed -e 's/wgs_file/'${wgrib2_file}'/' -e 's/wgs_var/'${var}'/' 3uv.gs > 3uv_OK.gs
  grads -bpc 3uv_OK.gs
  #    -e 's/wgs_fyear/'${f_year}'/' -e 's/wgs_fmon/'${f_mon}'/' -e 's/wgs_fday/'${f_day}'/'  \
