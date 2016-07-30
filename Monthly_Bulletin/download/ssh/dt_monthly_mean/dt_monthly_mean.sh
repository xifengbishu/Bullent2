#!/bin/bash
datetime=`date +%Y%m%d`

lftp meixiang:indf237@ftp.aviso.oceanobs.com <<EOF
mget global/delayed-time/grids/climatology/monthly_mean/dt_global_allsat_msla_h_y2014_m12.nc.gz
mget global/delayed-time/grids/climatology/monthly_mean/dt_global_allsat_msla_h_y2015_m01.nc.gz
mget global/delayed-time/grids/climatology/monthly_mean/dt_global_allsat_msla_h_y2015_m02.nc.gz
mget global/delayed-time/grids/climatology/monthly_mean/dt_global_allsat_msla_h_y2015_m03.nc.gz
mget global/delayed-time/grids/climatology/monthly_mean/dt_global_allsat_msla_h_y2015_m04.nc.gz
mget global/delayed-time/grids/climatology/monthly_mean/dt_global_allsat_msla_h_y2015_m05.nc.gz
mget global/delayed-time/grids/climatology/monthly_mean/dt_global_allsat_msla_h_y2015_m06.nc.gz
mget global/delayed-time/grids/climatology/monthly_mean/dt_global_allsat_msla_h_y2015_m07.nc.gz
mget global/delayed-time/grids/climatology/monthly_mean/dt_global_allsat_msla_h_y2015_m08.nc.gz
mget global/delayed-time/grids/climatology/monthly_mean/dt_global_allsat_msla_h_y2015_m09.nc.gz
mget global/delayed-time/grids/climatology/monthly_mean/dt_global_allsat_msla_h_y2015_m10.nc.gz
mget global/delayed-time/grids/climatology/monthly_mean/dt_global_allsat_msla_h_y2015_m11.nc.gz
mget global/delayed-time/grids/climatology/monthly_mean/dt_global_allsat_msla_h_y2015_m12.nc.gz
quit
EOF

#mget global/delayed-time/grids/climatology/monthly_mean/dt_global_allsat_msla_h_y2011*
