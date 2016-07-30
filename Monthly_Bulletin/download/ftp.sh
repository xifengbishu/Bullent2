#!/bin/bash
datetime=`date +%Y%m%d`

lftp meixiang:indf237@ftp.aviso.oceanobs.com <<EOF
mget global/near-real-time/grids/msla/all-sat-merged/h/nrt_global_allsat_msla_h_201405*.nc.gz
mget global/near-real-time/grids/msla/all-sat-merged/h/nrt_global_allsat_msla_h_201406*.nc.gz
mget global/near-real-time/grids/msla/all-sat-merged/h/nrt_global_allsat_msla_h_201407*.nc.gz
quit
EOF

#mget global/nrt/msla/merged/h/nrt_global_merged_msla_h_201409*
