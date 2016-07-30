;*****************************************************
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
;*****************************************************
begin
  f1="./oscar_vel2014.nc"
  f2="./oscar_vel2013.nc"
  f3="./oscar_vel2012.nc"
  f4="./oscar_vel2011.nc"
  f5="./oscar_vel2010.nc"
  f6="./oscar_vel2009.nc"
  f7="./oscar_vel2008.nc"
  f8="./oscar_vel2007.nc"
  f9="./oscar_vel2006.nc"
  f10="./oscar_vel2005.nc"
  f11="./oscar_vel2004.nc"

  ;f12="./oscar_vel2015.nc"

  a=addfile(f1,"r")
  b=addfile(f2,"r")
  c=addfile(f3,"r")
  d=addfile(f4,"r")
  e=addfile(f5,"r")
  f=addfile(f6,"r")
  g=addfile(f7,"r")
  h=addfile(f8,"r")
  i=addfile(f9,"r")
  j=addfile(f10,"r")
  k=addfile(f11,"r")

  ;nn=addfile(f12,"r")

  ;u=dble2flt(nn->u(wgs_t1:wgs_t2,0,:,:))
  ;v=dble2flt(nn->v(wgs_t1:wgs_t2,0,:,:))

  u1=dble2flt(b->u(wgs_t1:wgs_t2,0,:,:))
  v1=dble2flt(b->v(wgs_t1:wgs_t2,0,:,:))
  u2=dble2flt(c->u(wgs_t1:wgs_t2,0,:,:))
  v2=dble2flt(c->v(wgs_t1:wgs_t2,0,:,:))
  u3=dble2flt(d->u(wgs_t1:wgs_t2,0,:,:))
  v3=dble2flt(d->v(wgs_t1:wgs_t2,0,:,:))
  u4=dble2flt(e->u(wgs_t1:wgs_t2,0,:,:))
  v4=dble2flt(e->v(wgs_t1:wgs_t2,0,:,:))
  u5=dble2flt(f->u(wgs_t1:wgs_t2,0,:,:))
  v5=dble2flt(f->v(wgs_t1:wgs_t2,0,:,:))
  u6=dble2flt(g->u(wgs_t1:wgs_t2,0,:,:))
  v6=dble2flt(g->v(wgs_t1:wgs_t2,0,:,:))
;  u7=dble2flt(h->u(wgs_t1:wgs_t2,0,:,:))
;  v7=dble2flt(h->v(wgs_t1:wgs_t2,0,:,:))
;  u8=dble2flt(i->u(wgs_t1:wgs_t2,0,:,:))
;  v8=dble2flt(i->v(wgs_t1:wgs_t2,0,:,:))
;  u9=dble2flt(j->u(wgs_t1:wgs_t2,0,:,:))
;  v9=dble2flt(j->v(wgs_t1:wgs_t2,0,:,:))
; u10=dble2flt(k->u(wgs_t1:wgs_t2,0,:,:))
; v10=dble2flt(k->v(wgs_t1:wgs_t2,0,:,:))
; u11=dble2flt(a->u(wgs_t1:wgs_t2,0,:,:))
; v11=dble2flt(a->v(wgs_t1:wgs_t2,0,:,:))
  
  ;u_cha=u-(u1+u2+u3+u4+u5+u6+u7+u8+u9+u10+u11)/11.0
  ;v_cha=v-(v1+v2+v3+v4+v5+u6+u7+u8+u9+u10+u11)/11.0
  ;u_cha=u-(u1+u2+u3+u4+u5+u6)/5.0
  ;v_cha=v-(v1+v2+v3+v4+v5+u6)/5.0

  ;u_ave=(u1+u2+u3+u4+u5+u6+u7+u8+u9+u10+u11)/10.0
  ;v_ave=(v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11)/10.0
  u_ave=(u1+u2+u3+u4+u5+u6)/5.0
  v_ave=(v1+v2+v3+v4+v5+u6)/5.0

  copy_VarCoords(u1,u_ave)
  copy_VarCoords(v1,v_ave)

  ;copy_VarCoords(u,u_cha)
  ;copy_VarCoords(v,v_cha)

  ;printVarSummary(uu)
  ;exit


  uu_ave=dim_avg_n_Wrap(u_ave,0)
  vv_ave=dim_avg_n_Wrap(v_ave,0)
  value = 1.e20
  replace_ieeenan (uu_ave, value, 0)
  uu_ave@_FillValue = value
  replace_ieeenan (vv_ave, value, 0)
  vv_ave@_FillValue = value


  vel=sqrt(uu_ave*uu_ave+vv_ave*vv_ave)
  copy_VarCoords(uu_ave,vel)

  ;printVarSummary(u_dev)
  ;u_mean=avg(u(1:6,:,:))
  ;u_mean=avg(u({7758:7760},:,:))

  ;print (u_dev)
  ;printVarSummary(u1_mean)
 ;exit
;*****************************************************
;   Create plot
;*****************************************************
 wks  = gsn_open_wks("eps","2oscar")                  ; select output
 ;gsn_define_colormap(wks,"BlWhRe")                  ; choose colormap 
  gsn_define_colormap(wks,"BlAqGrYeOrRevi200")  ; choose color map
 ;i = NhlNewColor(wks,1.0,.89,.76)                   ; add bisque to colormap 

 res                             = True             ; plot mods desired

 res@cnFillOn                    = True             ; turn on color 
  ;res@cnFillPalette        = "rainbow"              ; choose colormap
 ;res@cnFillPalette        = "cmp_flux"              ; choose colormap
  ;res@cnFillPalette        = "WhiteBlueGreenYellowRed"              ; choose colormap
  res@gsnSpreadColors      = True               ; use full color map
  res@gsnSpreadColorStart  = 17                 ; start at color 17
  res@gsnSpreadColorEnd    = 200                ; end at color 200
 res@cnLinesOn                   = False
 res@gsnAddCyclic                = False           ; regional data
 res@gsnSpreadColors             = False             ; use full color map
 ;res@gsnSpreadColorEnd           = -3               ; don't use added bisque
 res@lbLabelAutoStride           = True             ; nice label bar labels
 ;res@lbLabelPosition           = "Top"             ; nice label bar labels
 ;res@lgLabelPosition           = "Right"             ; nice label bar labels
 res@lbOrientation        = "Vertical"

 ;res@mpLandFillColor             = "bisque"         ; choose land color
 ;res@cnFillMode  = "Rasterfill"

 res@cnLevelSelectionMode        = "ManualLevels"   ; manual contour levels
 res@cnMinLevelValF              = 0.0             ; set min contour level
 res@cnMaxLevelValF              = 2.0             ; set max contour level
 res@cnLevelSpacingF             = 0.1           ; contour interval

; zoom in on region
 res@mpLimitMode="LatLon" 
 res@mpMinLatF                   = 0
 res@mpMaxLatF                   = 50
 res@mpMinLonF                   = 100
 res@mpMaxLonF                   = 150
 ;res@mpMinLatF                   = min(u&Latitude)
 ;res@mpMaxLatF                   = max(u&Latitude)
 ;res@mpMinLonF                   = min(u&Longitude)
 ;res@mpMaxLonF                   = max(u&Longitude)

 ;res@tiMainString                = "Hycom:archv.0021_016_00_3zu.nc" 
;res@gsnScalarContour     = True
;res@vcRefMagnitudeF=0.06                       ; add a reference vector
;res@vcRefLengthF=0.1                    ; what the ref length is
;res@vcMonoLineArrowColor = False  ;
;res@vcGlyphStyle ="LineArrow"
;res@vcRefAnnoOrthogonalPosF =-0.35
;res@vcRefAnnoParallelPosF =0.18
;res@vcMaxMagnitudeF=0.08
;res@vcRefAnnoString2On= False
;res@vcMinDistanceF = 0.03

  res@stLevelSelectionMode      = "AutomaticLevels"                        ; arrows start every third
  ;res@stLevelCount      = 16                        ; arrows start every third
  ;res@stLevelSpacingF      = 4                        ; arrows start every third
  ;res@stArrowStride      = 2                        ; arrows start every third
  res@stMinDistanceF      = 0.015                      ; arrows start every third
  res@stArrowLengthF     = 0.005            ; changes the size of the arrows.
  res@stArrowStride     = 4            ; changes the size of the arrows.
  res@stLineThicknessF      = 0.1                      ; arrows start every third
  ;res@stLineColor      = "gray"                        ; arrows start every third



  ;res@tiMainOn      = True                        ; arrows start every third
  ;res@tiMainFont      = 3                        ; arrows start every third
  res@gsnStringFontHeightF = 0.016
  res@tmXBLabelFontHeightF = 0.016                ; resize tick labels
  res@tmYLLabelFontHeightF = 0.016
  ;res@lbLabelStride    = 2                        ; every other label
  res@tmXBTickSpacingF = 10.                      ; every 60 degrees
  ;res@tmYBTickSpacingF = 10.                      ; every 60 degrees
  res@gsnLeftString   = "Climatological"               ; add the gsn titles
  ;res@gsnCenterString = "centerstring"
  res@gsnRightString  = "m/s"


  ;ocean_only = u_mean
  ;ocean_only = mask(u_mean,v_mean,0)

 ;plot  = gsn_csm_contour_map_ce(wks,u_mean(:,:),res)
;plot  = gsn_csm_contour_map_ce(wks,vel(:,:),res)
;plot = gsn_csm_streamline_contour_map_ce(wks,u([1:6],:,:),v([1:6],:,:),vel(:,:),res)
;plot = gsn_csm_streamline_contour_map_ce(wks,uu_cha(:,:),vv_cha(:,:),vel(:,:),res)

plot = gsn_csm_streamline_contour_map_ce(wks,uu_ave(:,:),vv_ave(:,:),vel(:,:),res)

;plot=gsn_csm_vector_map_ce(wks,u_mean(:,:),v_mean(:,:),res)
 ;plot=gsn_csm_vector_map_ce(wks,u_mean(:,:),v_mean(:,:),res)
 ;plot=gsn_csm_streamline_map_ce(wks,u_mean(:,:),v_mean(:,:),res)
 ;plot=gsn_csm_streamline_map_ce(wks,u_mean(:,:),v_mean(:,:),vel(:,:),res)

  res@gsnSpreadColors  = True                      ; use full colormap

  res@tiMainString     = "Streamlines colored by a scalar field"


;  u = f->U(0,0,:,:)                ; read in example data [2D only here]
;  v = f->V(0,0,:,:)

;---Graphics

  res2                 = True                           ; plot mods desired
  res2@tiMainString    = "Example of a streamline plot" ; title

;  plot = gsn_csm_streamline_map_ce(wks,u(1,{},:),v(1,:,:),res2)
;  plot = gsn_streamline_scalar(wks,u_mean(:,:),v_mean(:,:),vel(:,:),res2)


end




