#!/bin/csh
set month = 10
  while ( ${month} < 11 )

run_ide.csh air.2m.mon.mean.nc ${month} 1 
run_ide.csh air.2m.mon.mean.nc ${month} 0 

run_ide.csh slp.mon.mean.nc ${month} 1
run_ide.csh slp.mon.mean.nc ${month} 0

run_ide.csh sst.mnmean.nc ${month} 1
run_ide.csh sst.mnmean.nc ${month} 0

# === wind ===
set t_beg = ${month}
set anomaly = 1
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' uv_ide.gs > uv_OK.gs
grads -bpc uv_OK.gs

set t_beg = ${month}
set anomaly = 0
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' uv_ide.gs > uv_OK.gs
grads -bpc uv_OK.gs

# === SSH ===
 set t_beg = ${month}
 if( ${month} < 10 ) then
    set t_beg = '0'${month}
  endif
set anomaly = 1
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' ssh_ide.gs > ssh_OK.gs
grads -bpc ssh_OK.gs

 set t_beg = ${month}
 if( ${month} < 10 ) then
    set t_beg = '0'${month}
  endif
set anomaly = 0
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' ssh_ide.gs > ssh_OK.gs
grads -bpc ssh_OK.gs


  set month = `expr $month + 1`
  end

# === clean
rm -f *_OK.gs
mv *jpg RESULT
mv *eps RESULT
