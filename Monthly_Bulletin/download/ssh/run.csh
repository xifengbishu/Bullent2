#!/bin/csh
  foreach file ( `ls ./ssh2/nrt_global_merged_msla_h_201401*nc` )
   echo $file:t 
  sed -e 's/wgs_file/'${wgrib2_file}'/' -e 's/wgs_var/'${var}'/' -e 's/wgs_tbeg/'${t_beg}'/' \
      -e 's/wgs_t81/'${t81}'/' -e 's/wgs_t10/'${t10}'/' -e 's/wgs_t14/'${t14}'/' \
      -e 's/wgs_anomaly/'${anomaly}'/' \
  1var.gs > 1var_OK.gs
  end
