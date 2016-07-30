;*****************************************************
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
;*****************************************************
begin
  filein="oscar_velwgs_year.nc"
  a=addfile(filein,"r")
  ;u=dble2flt(a->u(:,0,:,:))
  u=dble2flt(a->u(wgs_t1:wgs_t2,0,{-80:80},:))
  v=dble2flt(a->v(wgs_t1:wgs_t2,0,{-80:80},:))
  ;u=dble2flt(a->u({7758:7764},0,:,:))
  ;v=dble2flt(a->u([1:6],0,:,:))
  u_mean=dim_avg_n_Wrap(u,0)
  v_mean=dim_avg_n_Wrap(v,0)

  printVarSummary(u)
  ;u_mean=avg(u(1:6,:,:))
  ;u_mean=avg(u({7758:7760},:,:))

  ;print (u_mean)
  printVarSummary(u_mean)
 ;exit
;*****************************************************
;   Create plot
;*****************************************************
 wks  = gsn_open_wks("eps","2oscar")                  ; select output
 ;gsn_define_colormap(wks,"BlWhRe")                  ; choose colormap 
  gsn_define_colormap(wks,"BlAqGrYeOrRevi200")  ; choose color map
 i = NhlNewColor(wks,1.0,.89,.76)                   ; add bisque to colormap 

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

printVarSummary(u_mean)
 value = 1.e20
replace_ieeenan (u, value, 0)
u@_FillValue = value
replace_ieeenan (v, value, 0)
v@_FillValue = value

  ;printVarSummary(u(1,:,:))
  ;exit

replace_ieeenan (u_mean, value, 0)
u_mean@_FillValue = value
replace_ieeenan (v_mean, value, 0)
v_mean@_FillValue = value
vel=sqrt(u_mean*u_mean+v_mean*v_mean)
copy_VarCoords(u_mean,vel)

  ;ocean_only = u_mean
  ;ocean_only = mask(u_mean,v_mean,0)
  res@gsnRightString  = "m/s"

 ;plot  = gsn_csm_contour_map_ce(wks,u_mean(:,:),res)
;plot  = gsn_csm_contour_map_ce(wks,vel(:,:),res)
;plot = gsn_csm_streamline_contour_map_ce(wks,u([1:6],:,:),v([1:6],:,:),vel(:,:),res)
plot = gsn_csm_streamline_contour_map_ce(wks,u_mean(:,:),v_mean(:,:),vel(:,:),res)
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




