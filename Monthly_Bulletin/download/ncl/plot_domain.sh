#!/bin/sh
#
# --- Purpose:
# ---   1) plot WRF domain
# ---   2) onvert PS file to JPG file
# ---
# --- Dr. GAO Shanhong, 09 Mar 2011.
# ---
# -----------------------------------
#

 # --- plot WRF domain by calling wps_domain.ncl
 year=2015
 month=1
 while [ $month -le 12 ]
 do
   t1=` expr $month \* 6 - 6 `
   t2=` expr $month \* 6 - 1 `
echo $t1 $t2
   sed -e 's/wgs_year/'${year}'/' -e 's/wgs_t1/'${t1}'/' -e 's/wgs_t2/'${t2}'/' oscar.ncl > oscar_OK.ncl
   ncl oscar_OK.ncl
    convert -density 600 2oscar.eps temp.jpg
    #convert -resize 50% -trim -rotate -90 temp.jpg domain.jpg 
    #convert oscar.ps temp.jpg
    convert -trim temp.jpg oscar_${year}_${month}.jpg 
    mv 2oscar.eps oscar_${year}_${month}.eps
    #convert -trim -rotate -90 temp.jpg domain.jpg 
    rm -f temp.jpg oscar.eps
   month=`expr $month + 1`
 done


# ================ End of File =====================
