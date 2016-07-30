'reinit'
month=05
'sdfopen nrt_global_merged_msla_h_2014'month'.nc'

lon_domain='lon 105 135'
lat_domain='lat 5 35'
     title='diff'
plot_nice = 0
***************************************************************************
*********************the loop of time**************************************

* --- output name
  outname = title'_'month

*

'set grads off'
'set grid off'
*'set mpdset hires'
'set map 8 1 4'
*'set clab forced'
'set font 5'
'set xlopts 1 6 0.15'
'set ylopts 1 6 0.15'
'set clopts 1 6 0.05'
'set strsiz 0.25'
'set ccolor rainbow'
***************************************************************************

'set 'lon_domain
'set 'lat_domain
'set t 1'
'set z 1'
'define ww=Grid_0001'
'set ccolor 3'
* -----------------------------
*'d Grid_0001'
'close 1'

'sdfopen ave_nrt_global_allsat_msla_h_2014'month'.nc'
'set ccolor 2'
'set 'lon_domain
'set 'lat_domain
'd sla*100-ww'
* -----------------------------
* -----------------------------


*'cbar'

  'gxprint ./'outname'.eps white'

* --- convert gm to eps 
if ( plot_nice = 0 )
* --- convert eps to gif 
  '! convert -density 144 -antialias -trim 'outname'.eps 'outname'.bmp'
  '! convert -density 144 -antialias -trim 'outname'.bmp 'outname'.jpg'
else
* --- imagick software needed
  '! convert -density 1200 -resize 25% -trim 'outname'.eps tmp.jpg'
  '! convert -density 300  tmp.jpg 'outname'.jpg'
*  '! convert -resize 50% 'outname'.jpg 'outname'.gif'
  '! rm -f    tmp.jpg'
endif

  '! rm -f 'outname'.bmp'
  '! rm -f 'outname'.eps'
*  '! rm -f 'outname'.gif'
*********************************loop of time****************************
  'reinit'
  'quit'
