#!/bin/csh
# === SSH ===
set month = 8
 set t_beg = ${month}
 if( ${month} < 10 ) then
    set t_beg = '0'${month}
  endif
set anomaly = 0
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' ssh.gs > ssh_OK.gs
grads -bpc ssh_OK.gs

set month = 8
 set t_beg = ${month}
 if( ${month} < 10 ) then
    set t_beg = '0'${month}
  endif
set anomaly = 1
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' ssh.gs > ssh_OK.gs
grads -bpc ssh_OK.gs

# === clean
