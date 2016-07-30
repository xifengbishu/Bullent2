#!/bin/csh
#mv *nc OLD
#lftp -f lftp

echo 'new ---' > msg
ncl_filedump air.2m.mon.mean.nc | grep 'unlimited' >> msg
ncl_filedump slp.mon.mean.nc | grep 'unlimited' >> msg
ncl_filedump sst.mnmean.nc | grep 'unlimited' >> msg
ncl_filedump uwnd.10m.mon.mean.nc | grep 'unlimited' >> msg
ncl_filedump vwnd.10m.mon.mean.nc | grep 'unlimited' >> msg
cd OLD 
echo 'old ---' >> ../msg
ncl_filedump air.2m.mon.mean.nc | grep 'unlimited' >> ../msg
ncl_filedump slp.mon.mean.nc | grep 'unlimited' >> ../msg
ncl_filedump sst.mnmean.nc | grep 'unlimited' >> ../msg
ncl_filedump uwnd.10m.mon.mean.nc | grep 'unlimited' >> ../msg
ncl_filedump vwnd.10m.mon.mean.nc | grep 'unlimited' >> ../msg
