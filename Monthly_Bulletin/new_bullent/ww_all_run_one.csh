#!/bin/csh
set month = 3
# === SSH ===
set month = 3
 set t_beg = ${month}
 if( ${month} < 10 ) then
    set t_beg = '0'${month}
  endif
set anomaly = 1
sed -e 's/wgs_anomaly/'${anomaly}'/' -e 's/wgs_tbeg/'${t_beg}'/' ssh_ide.gs > ssh_ide_OK.gs
grads -bpc ssh_ide_OK.gs
