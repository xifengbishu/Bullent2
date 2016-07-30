#!/bin/csh
run.csh air.2m.mon.mean.nc 3 1 
run.csh air.2m.mon.mean.nc 3 0 

run.csh air.2m.mon.mean.nc 4 1 
run.csh air.2m.mon.mean.nc 4 0 

run.csh slp.mon.mean.nc 3 1
run.csh slp.mon.mean.nc 3 0

run.csh slp.mon.mean.nc 4 1
run.csh slp.mon.mean.nc 4 0

run.csh sst.mnmean.nc 3 1
run.csh sst.mnmean.nc 3 0

run.csh sst.mnmean.nc 4 1
run.csh sst.mnmean.nc 4 0
# === wind ===
set t_beg = 3
set anomaly = 1
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' uv.gs > uv_OK.gs
grads -bpc uv_OK.gs

set t_beg = 3
set anomaly = 0
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' uv.gs > uv_OK.gs
grads -bpc uv_OK.gs

set t_beg = 4
set anomaly = 1
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' uv.gs > uv_OK.gs
grads -bpc uv_OK.gs

set t_beg = 4
set anomaly = 0
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' uv.gs > uv_OK.gs
grads -bpc uv_OK.gs
# === SSH ===
set month = 3
 set t_beg = ${month}
 if( ${month} < 10 ) then
    set t_beg = '0'${month}
  endif
set anomaly = 1
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' ssh.gs > ssh_OK.gs
grads -bpc ssh_OK.gs

set month = 3
 set t_beg = ${month}
 if( ${month} < 10 ) then
    set t_beg = '0'${month}
  endif
set anomaly = 0
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' ssh.gs > ssh_OK.gs
grads -bpc ssh_OK.gs

set month = 4
 set t_beg = ${month}
 if( ${month} < 10 ) then
    set t_beg = '0'${month}
  endif
set anomaly = 1
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' ssh.gs > ssh_OK.gs
grads -bpc ssh_OK.gs

set month = 4
 set t_beg = ${month}
 if( ${month} < 10 ) then
    set t_beg = '0'${month}
  endif
set anomaly = 0
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' ssh.gs > ssh_OK.gs
grads -bpc ssh_OK.gs
# === clean
rm -f *_OK.gs
mv *jpg RESULT