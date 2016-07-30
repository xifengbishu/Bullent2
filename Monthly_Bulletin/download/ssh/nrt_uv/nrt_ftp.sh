#!/bin/bash
datetime=`date +%Y%m%d`

lftp meixiang:indf237@ftp.aviso.oceanobs.com <<EOF
mget global/near-real-time/grids/msla/all-sat-merged/uv/nrt_global_allsat_msla_uv_2015*.nc.gz
quit
EOF
#wget ftp://meixiang:indf237@ftp.aviso.oceanobs.com/global/near-real-time/grids/msla/all-sat-merged/uv/nrt_global_allsat_msla_uv_20160201_20160201.nc.gz

#mget global/nrt/msla/merged/h/nrt_global_merged_msla_h_201409*
