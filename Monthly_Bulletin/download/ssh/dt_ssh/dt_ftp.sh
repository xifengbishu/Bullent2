#!/bin/bash
datetime=`date +%Y%m%d`

lftp meixiang:indf237@ftp.aviso.oceanobs.com <<EOF
mget global/delayed-time/grids/msla/all-sat-merged/h/2014/dt_global_allsat_msla_h_2014*
quit
EOF

#mget global/dt/upd/msla/merged/h/dt_upd_global_merged_msla_h_201410*
#/global/delayed-time/grids/msla/all-sat-merged/h/2014/dt_global_allsat_msla_h_20140320_20140829.nc.gz
