#!/bin/csh
set month = 1
  while ( ${month} < 10 )

run_ide.csh air.2m.mon.mean.nc ${month} 0 

# === wind ===
set t_beg = ${month}
set anomaly = 1
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' uv_ide.gs > uv_OK.gs
grads -bpc uv_OK.gs

set t_beg = ${month}
set anomaly = 0
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' uv_ide.gs > uv_OK.gs
grads -bpc uv_OK.gs

  set month = `expr $month + 1`
  end

# === clean
rm -f *_OK.gs
#mv *jpg RESULT
#mv *eps RESULT
